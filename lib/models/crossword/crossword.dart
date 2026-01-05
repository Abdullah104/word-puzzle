import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:characters/characters.dart';
import 'package:word_puzzle/models/crossword_character/crossword_character.dart';
import 'package:word_puzzle/models/crossword_word/crossword_word.dart';
import 'package:word_puzzle/models/direction.dart';
import 'package:word_puzzle/models/location/location.dart';

part 'crossword.g.dart';

/// A crossword puzzle. This is a grid of characters with words placed in it.
/// The puzzle constraint is in the English crossword puzzle tradition.
abstract class Crossword implements Built<Crossword, CrosswordBuilder> {
  Crossword._();

  factory Crossword([void Function(CrosswordBuilder)? updates]) = _$Crossword;

  factory Crossword.crossword({
    required int width,
    required int height,
    Iterable<CrosswordWord>? words,
  }) => Crossword((b) {
    b
      ..width = width
      ..height = height;

    if (words != null) b.words.addAll(words);
  });

  static Serializer<Crossword> get serializer => _$crosswordSerializer;

  int get width;

  int get height;

  // The words in the crossword
  BuiltList<CrosswordWord> get words;

  // The characters by location. useful for displaying the crossword.
  BuiltMap<Location, CrosswordCharacter> get characters;

  // Checks if this crossword is valid.
  bool get valid {
    // Checks that there are no duplicate words.
    final wordSet = words.map((word) => word.word).toBuiltSet();
    if (wordSet.length != words.length) return false;

    for (final MapEntry(key: location, value: character)
        in characters.entries) {
      // All characters must be be part of an across or down word.
      if (character.acrossWord == null && character.downWord == null) {
        return false;
      }

      // All characters must be within the crossword puzzle.
      // No drawing outside the lines.
      if (location.x < 0 ||
          location.y < 0 ||
          location.x >= width ||
          location.y >= height) {
        return false;
      }

      // Characters above and below this character must be related by a vertical
      // word.
      if (characters[location.up] case final up?) {
        if (character.downWord == null) return false;
        if (up.downWord != character.downWord) return false;
      }

      if (characters[location.down] case final down?) {
        if (character.downWord == null) return false;
        if (down.downWord != character.downWord) return false;
      }

      // Characters to the left and right of this character must be related by a
      // horizontal word.
      final left = characters[location.left];
      if (left != null) {
        if (character.acrossWord == null) return false;
        if (left.acrossWord != character.acrossWord) return false;
      }

      final right = characters[location.right];
      if (right != null) {
        if (character.acrossWord == null) return false;
        if (right.acrossWord != character.acrossWord) return false;
      }
    }

    return true;
  }

  Crossword? addWord({
    required Location location,
    required String word,
    required Direction direction,
  }) {
    // Require that the word is not already in the crossword.
    if (words.map((word) => word.word).contains(word)) return null;

    final wordCharacters = word.characters;
    var overlap = false;

    // Check that the word fits in the crossword.
    for (final (index, character) in wordCharacters.indexed) {
      final characterLocation = switch (direction) {
        .across => location.rightOffset(index),
        .down => location.downOffset(index),
      };

      final target = characters[characterLocation];
      if (target != null) {
        overlap = true;

        if (target.character != character) return null;

        if (direction == .across && target.acrossWord != null ||
            direction == .down && target.downWord != null) {
          return null;
        }
      }
    }

    if (words.isNotEmpty && !overlap) return null;

    final candidate = rebuild(
      (b) => b
        ..words.add(
          CrosswordWord.word(
            word: word,
            location: location,
            direction: direction,
          ),
        ),
    );

    if (candidate.valid) {
      return candidate;
    } else {
      return null;
    }
  }

  /// As a finalize step, fill in the characters map.
  @BuiltValueHook(finalizeBuilder: true)
  static void _fillCharacters(CrosswordBuilder b) {
    b.characters.clear();

    for (final word in b.words.build()) {
      for (final (idx, character) in word.word.characters.indexed) {
        switch (word.direction) {
          case .across:
            b.characters.updateValue(
              word.location.rightOffset(idx),
              (b) => b.rebuild((bInner) => bInner.acrossWord.replace(word)),
              ifAbsent: () => CrosswordCharacter.character(
                acrossWord: word,
                character: character,
              ),
            );
          case .down:
            b.characters.updateValue(
              word.location.downOffset(idx),
              (b) => b.rebuild((bInner) => bInner.downWord.replace(word)),
              ifAbsent: () => CrosswordCharacter.character(
                character: character,
                downWord: word,
              ),
            );
        }
      }
    }
  }

  String prettyPrintCrossword() {
    final buffer = StringBuffer();
    final grid = List.generate(height, (_) => List.generate(width, (_) => '░'));

    for (final MapEntry(key: Location(:x, :y), value: character)
        in characters.entries) {
      grid[y][x] = character.character;
    }

    for (final row in grid) {
      buffer.writeln(row.join());
    }

    buffer.writeln();
    buffer.writeln('Across:');

    for (final word
        in words.where((word) => word.direction == .across).toList()
          ..sort(CrosswordWord.locationComparator)) {
      buffer.writeln('${word.location.prettyPrint()} ${word.word}');
    }

    buffer.writeln();
    buffer.writeln('Down:');

    for (final word
        in words.where((word) => word.direction == .down).toList()
          ..sort(CrosswordWord.locationComparator)) {
      buffer.writeln('${word.location.prettyPrint()} ${word.word}');
    }

    return buffer.toString();
  }
}
