// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crossword_character.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CrosswordCharacter> _$crosswordCharacterSerializer =
    _$CrosswordCharacterSerializer();

class _$CrosswordCharacterSerializer
    implements StructuredSerializer<CrosswordCharacter> {
  @override
  final Iterable<Type> types = const [CrosswordCharacter, _$CrosswordCharacter];
  @override
  final String wireName = 'CrosswordCharacter';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    CrosswordCharacter object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'character',
      serializers.serialize(
        object.character,
        specifiedType: const FullType(String),
      ),
    ];
    Object? value;
    value = object.acrossWord;
    if (value != null) {
      result
        ..add('acrossWord')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(CrosswordWord),
          ),
        );
    }
    value = object.downWord;
    if (value != null) {
      result
        ..add('downWord')
        ..add(
          serializers.serialize(
            value,
            specifiedType: const FullType(CrosswordWord),
          ),
        );
    }
    return result;
  }

  @override
  CrosswordCharacter deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CrosswordCharacterBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'character':
          result.character =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'acrossWord':
          result.acrossWord.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(CrosswordWord),
                )!
                as CrosswordWord,
          );
          break;
        case 'downWord':
          result.downWord.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(CrosswordWord),
                )!
                as CrosswordWord,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$CrosswordCharacter extends CrosswordCharacter {
  @override
  final String character;
  @override
  final CrosswordWord? acrossWord;
  @override
  final CrosswordWord? downWord;

  factory _$CrosswordCharacter([
    void Function(CrosswordCharacterBuilder)? updates,
  ]) => (CrosswordCharacterBuilder()..update(updates))._build();

  _$CrosswordCharacter._({
    required this.character,
    this.acrossWord,
    this.downWord,
  }) : super._();
  @override
  CrosswordCharacter rebuild(
    void Function(CrosswordCharacterBuilder) updates,
  ) => (toBuilder()..update(updates)).build();

  @override
  CrosswordCharacterBuilder toBuilder() =>
      CrosswordCharacterBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CrosswordCharacter &&
        character == other.character &&
        acrossWord == other.acrossWord &&
        downWord == other.downWord;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, character.hashCode);
    _$hash = $jc(_$hash, acrossWord.hashCode);
    _$hash = $jc(_$hash, downWord.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CrosswordCharacter')
          ..add('character', character)
          ..add('acrossWord', acrossWord)
          ..add('downWord', downWord))
        .toString();
  }
}

class CrosswordCharacterBuilder
    implements Builder<CrosswordCharacter, CrosswordCharacterBuilder> {
  _$CrosswordCharacter? _$v;

  String? _character;
  String? get character => _$this._character;
  set character(String? character) => _$this._character = character;

  CrosswordWordBuilder? _acrossWord;
  CrosswordWordBuilder get acrossWord =>
      _$this._acrossWord ??= CrosswordWordBuilder();
  set acrossWord(CrosswordWordBuilder? acrossWord) =>
      _$this._acrossWord = acrossWord;

  CrosswordWordBuilder? _downWord;
  CrosswordWordBuilder get downWord =>
      _$this._downWord ??= CrosswordWordBuilder();
  set downWord(CrosswordWordBuilder? downWord) => _$this._downWord = downWord;

  CrosswordCharacterBuilder();

  CrosswordCharacterBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _character = $v.character;
      _acrossWord = $v.acrossWord?.toBuilder();
      _downWord = $v.downWord?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CrosswordCharacter other) {
    _$v = other as _$CrosswordCharacter;
  }

  @override
  void update(void Function(CrosswordCharacterBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CrosswordCharacter build() => _build();

  _$CrosswordCharacter _build() {
    _$CrosswordCharacter _$result;
    try {
      _$result =
          _$v ??
          _$CrosswordCharacter._(
            character: BuiltValueNullFieldError.checkNotNull(
              character,
              r'CrosswordCharacter',
              'character',
            ),
            acrossWord: _acrossWord?.build(),
            downWord: _downWord?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'acrossWord';
        _acrossWord?.build();
        _$failedField = 'downWord';
        _downWord?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'CrosswordCharacter',
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
