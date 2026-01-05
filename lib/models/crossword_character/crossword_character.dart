import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:word_puzzle/models/crossword_word/crossword_word.dart';

part 'crossword_character.g.dart';

abstract class CrosswordCharacter
    implements Built<CrosswordCharacter, CrosswordCharacterBuilder> {
  CrosswordCharacter._();

  factory CrosswordCharacter.character({
    required String character,
    CrosswordWord? acrossWord,
    CrosswordWord? downWord,
  }) => CrosswordCharacter((b) {
    b.character = character;

    if (acrossWord != null) b.acrossWord.replace(acrossWord);

    if (downWord != null) b.downWord.replace(downWord);
  });

  factory CrosswordCharacter([
    void Function(CrosswordCharacterBuilder)? updates,
  ]) = _$CrosswordCharacter;

  static Serializer<CrosswordCharacter> get serializer =>
      _$crosswordCharacterSerializer;

  String get character;

  CrosswordWord? get acrossWord;

  CrosswordWord? get downWord;
}
