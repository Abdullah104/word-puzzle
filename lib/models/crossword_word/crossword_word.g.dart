// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crossword_word.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CrosswordWord> _$crosswordWordSerializer =
    _$CrosswordWordSerializer();

class _$CrosswordWordSerializer implements StructuredSerializer<CrosswordWord> {
  @override
  final Iterable<Type> types = const [CrosswordWord, _$CrosswordWord];
  @override
  final String wireName = 'CrosswordWord';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    CrosswordWord object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'word',
      serializers.serialize(object.word, specifiedType: const FullType(String)),
      'location',
      serializers.serialize(
        object.location,
        specifiedType: const FullType(Location),
      ),
      'direction',
      serializers.serialize(
        object.direction,
        specifiedType: const FullType(Direction),
      ),
    ];

    return result;
  }

  @override
  CrosswordWord deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CrosswordWordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'word':
          result.word =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(String),
                  )!
                  as String;
          break;
        case 'location':
          result.location.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(Location),
                )!
                as Location,
          );
          break;
        case 'direction':
          result.direction =
              serializers.deserialize(
                    value,
                    specifiedType: const FullType(Direction),
                  )!
                  as Direction;
          break;
      }
    }

    return result.build();
  }
}

class _$CrosswordWord extends CrosswordWord {
  @override
  final String word;
  @override
  final Location location;
  @override
  final Direction direction;

  factory _$CrosswordWord([void Function(CrosswordWordBuilder)? updates]) =>
      (CrosswordWordBuilder()..update(updates))._build();

  _$CrosswordWord._({
    required this.word,
    required this.location,
    required this.direction,
  }) : super._();
  @override
  CrosswordWord rebuild(void Function(CrosswordWordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CrosswordWordBuilder toBuilder() => CrosswordWordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CrosswordWord &&
        word == other.word &&
        location == other.location &&
        direction == other.direction;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, word.hashCode);
    _$hash = $jc(_$hash, location.hashCode);
    _$hash = $jc(_$hash, direction.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CrosswordWord')
          ..add('word', word)
          ..add('location', location)
          ..add('direction', direction))
        .toString();
  }
}

class CrosswordWordBuilder
    implements Builder<CrosswordWord, CrosswordWordBuilder> {
  _$CrosswordWord? _$v;

  String? _word;
  String? get word => _$this._word;
  set word(String? word) => _$this._word = word;

  LocationBuilder? _location;
  LocationBuilder get location => _$this._location ??= LocationBuilder();
  set location(LocationBuilder? location) => _$this._location = location;

  Direction? _direction;
  Direction? get direction => _$this._direction;
  set direction(Direction? direction) => _$this._direction = direction;

  CrosswordWordBuilder();

  CrosswordWordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _word = $v.word;
      _location = $v.location.toBuilder();
      _direction = $v.direction;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CrosswordWord other) {
    _$v = other as _$CrosswordWord;
  }

  @override
  void update(void Function(CrosswordWordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  CrosswordWord build() => _build();

  _$CrosswordWord _build() {
    _$CrosswordWord _$result;
    try {
      _$result =
          _$v ??
          _$CrosswordWord._(
            word: BuiltValueNullFieldError.checkNotNull(
              word,
              r'CrosswordWord',
              'word',
            ),
            location: location.build(),
            direction: BuiltValueNullFieldError.checkNotNull(
              direction,
              r'CrosswordWord',
              'direction',
            ),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'location';
        location.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'CrosswordWord',
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
