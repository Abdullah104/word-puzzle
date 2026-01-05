import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

import 'crossword/crossword.dart';
import 'crossword_character/crossword_character.dart';
import 'crossword_word/crossword_word.dart';
import 'location/location.dart';

part 'serializers.g.dart';

/// Construct the serialization/deserialization code for the data models.
@SerializersFor([Location, Crossword, CrosswordWord, CrosswordCharacter])
final Serializers serializers = _$serializers;
