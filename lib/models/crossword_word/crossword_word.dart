import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:word_puzzle/models/direction.dart';
import 'package:word_puzzle/models/location/location.dart';

part 'crossword_word.g.dart';

abstract class CrosswordWord
    implements Built<CrosswordWord, CrosswordWordBuilder> {
  CrosswordWord._();

  factory CrosswordWord([void Function(CrosswordWordBuilder)? updates]) =
      _$CrosswordWord;

  factory CrosswordWord.word({
    required String word,
    required Location location,
    required Direction direction,
  }) => CrosswordWord(
    (b) => b
      ..word = word
      ..location.replace(location)
      ..direction = direction,
  );

  static Serializer<CrosswordWord> get serializer => _$crosswordWordSerializer;

  String get word;

  Location get location;

  Direction get direction;

  /// Compare two CrosswordWord by coordinates, x then y.
  static int locationComparator(CrosswordWord a, CrosswordWord b) {
    final compareRows = a.location.y.compareTo(b.location.y);
    final compareColumns = a.location.x.compareTo(b.location.x);

    return switch (compareColumns) {
      0 => compareRows,
      _ => compareColumns,
    };
  }
}
