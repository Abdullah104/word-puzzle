// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers =
    (Serializers().toBuilder()
          ..add(Crossword.serializer)
          ..add(CrosswordCharacter.serializer)
          ..add(CrosswordWord.serializer)
          ..add(Location.serializer)
          ..add(WorkQueue.serializer)
          ..addBuilderFactory(
            const FullType(BuiltList, const [const FullType(CrosswordWord)]),
            () => ListBuilder<CrosswordWord>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltMap, const [
              const FullType(Location),
              const FullType(CrosswordCharacter),
            ]),
            () => MapBuilder<Location, CrosswordCharacter>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltMap, const [
              const FullType(Location),
              const FullType(Direction),
            ]),
            () => MapBuilder<Location, Direction>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltSet, const [const FullType(Location)]),
            () => SetBuilder<Location>(),
          )
          ..addBuilderFactory(
            const FullType(BuiltSet, const [const FullType(String)]),
            () => SetBuilder<String>(),
          ))
        .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
