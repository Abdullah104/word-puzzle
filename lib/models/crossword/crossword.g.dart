// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crossword.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Crossword> _$crosswordSerializer = _$CrosswordSerializer();

class _$CrosswordSerializer implements StructuredSerializer<Crossword> {
  @override
  final Iterable<Type> types = const [Crossword, _$Crossword];
  @override
  final String wireName = 'Crossword';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Crossword object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'width',
      serializers.serialize(object.width, specifiedType: const FullType(int)),
      'height',
      serializers.serialize(object.height, specifiedType: const FullType(int)),
      'words',
      serializers.serialize(
        object.words,
        specifiedType: const FullType(BuiltList, const [
          const FullType(CrosswordWord),
        ]),
      ),
      'characters',
      serializers.serialize(
        object.characters,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(Location),
          const FullType(CrosswordCharacter),
        ]),
      ),
    ];

    return result;
  }

  @override
  Crossword deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CrosswordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'width':
          result.width =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'height':
          result.height =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(int),
                  )!
                  as int;
          break;
        case 'words':
          result.words.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltList, const [
                    const FullType(CrosswordWord),
                  ]),
                )!
                as BuiltList<Object?>,
          );
          break;
        case 'characters':
          result.characters.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(Location),
                const FullType(CrosswordCharacter),
              ]),
            )!,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$Crossword extends Crossword {
  @override
  final int width;
  @override
  final int height;
  @override
  final BuiltList<CrosswordWord> words;
  @override
  final BuiltMap<Location, CrosswordCharacter> characters;

  factory _$Crossword([void Function(CrosswordBuilder)? updates]) =>
      (CrosswordBuilder()..update(updates))._build();

  _$Crossword._({
    required this.width,
    required this.height,
    required this.words,
    required this.characters,
  }) : super._();
  @override
  Crossword rebuild(void Function(CrosswordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CrosswordBuilder toBuilder() => CrosswordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Crossword &&
        width == other.width &&
        height == other.height &&
        words == other.words &&
        characters == other.characters;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, width.hashCode);
    _$hash = $jc(_$hash, height.hashCode);
    _$hash = $jc(_$hash, words.hashCode);
    _$hash = $jc(_$hash, characters.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Crossword')
          ..add('width', width)
          ..add('height', height)
          ..add('words', words)
          ..add('characters', characters))
        .toString();
  }
}

class CrosswordBuilder implements Builder<Crossword, CrosswordBuilder> {
  _$Crossword? _$v;

  int? _width;
  int? get width => _$this._width;
  set width(int? width) => _$this._width = width;

  int? _height;
  int? get height => _$this._height;
  set height(int? height) => _$this._height = height;

  ListBuilder<CrosswordWord>? _words;
  ListBuilder<CrosswordWord> get words =>
      _$this._words ??= ListBuilder<CrosswordWord>();
  set words(ListBuilder<CrosswordWord>? words) => _$this._words = words;

  MapBuilder<Location, CrosswordCharacter>? _characters;
  MapBuilder<Location, CrosswordCharacter> get characters =>
      _$this._characters ??= MapBuilder<Location, CrosswordCharacter>();
  set characters(MapBuilder<Location, CrosswordCharacter>? characters) =>
      _$this._characters = characters;

  CrosswordBuilder();

  CrosswordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _width = $v.width;
      _height = $v.height;
      _words = $v.words.toBuilder();
      _characters = $v.characters.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Crossword other) {
    _$v = other as _$Crossword;
  }

  @override
  void update(void Function(CrosswordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Crossword build() => _build();

  _$Crossword _build() {
    Crossword._fillCharacters(this);
    _$Crossword _$result;
    try {
      _$result =
          _$v ??
          _$Crossword._(
            width: BuiltValueNullFieldError.checkNotNull(
              width,
              r'Crossword',
              'width',
            ),
            height: BuiltValueNullFieldError.checkNotNull(
              height,
              r'Crossword',
              'height',
            ),
            words: words.build(),
            characters: characters.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'words';
        words.build();
        _$failedField = 'characters';
        characters.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'Crossword',
          _$failedField,
          e.toString(),
        );
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
