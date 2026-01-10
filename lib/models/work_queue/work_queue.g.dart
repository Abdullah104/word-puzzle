// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_queue.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<WorkQueue> _$workQueueSerializer = _$WorkQueueSerializer();

class _$WorkQueueSerializer implements StructuredSerializer<WorkQueue> {
  @override
  final Iterable<Type> types = const [WorkQueue, _$WorkQueue];
  @override
  final String wireName = 'WorkQueue';

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    WorkQueue object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = <Object?>[
      'crossword',
      serializers.serialize(
        object.crossword,
        specifiedType: const FullType(Crossword),
      ),
      'locationsToTry',
      serializers.serialize(
        object.locationsToTry,
        specifiedType: const FullType(BuiltMap, const [
          const FullType(Location),
          const FullType(Direction),
        ]),
      ),
      'badLocations',
      serializers.serialize(
        object.badLocations,
        specifiedType: const FullType(BuiltSet, const [
          const FullType(Location),
        ]),
      ),
      'candidateWords',
      serializers.serialize(
        object.candidateWords,
        specifiedType: const FullType(BuiltSet, const [const FullType(String)]),
      ),
    ];

    return result;
  }

  @override
  WorkQueue deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = WorkQueueBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'crossword':
          result.crossword.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(Crossword),
                )!
                as Crossword,
          );
          break;
        case 'locationsToTry':
          result.locationsToTry.replace(
            serializers.deserialize(
              value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(Location),
                const FullType(Direction),
              ]),
            )!,
          );
          break;
        case 'badLocations':
          result.badLocations.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltSet, const [
                    const FullType(Location),
                  ]),
                )!
                as BuiltSet<Object?>,
          );
          break;
        case 'candidateWords':
          result.candidateWords.replace(
            serializers.deserialize(
                  value,
                  specifiedType: const FullType(BuiltSet, const [
                    const FullType(String),
                  ]),
                )!
                as BuiltSet<Object?>,
          );
          break;
      }
    }

    return result.build();
  }
}

class _$WorkQueue extends WorkQueue {
  @override
  final Crossword crossword;
  @override
  final BuiltMap<Location, Direction> locationsToTry;
  @override
  final BuiltSet<Location> badLocations;
  @override
  final BuiltSet<String> candidateWords;

  factory _$WorkQueue([void Function(WorkQueueBuilder)? updates]) =>
      (WorkQueueBuilder()..update(updates))._build();

  _$WorkQueue._({
    required this.crossword,
    required this.locationsToTry,
    required this.badLocations,
    required this.candidateWords,
  }) : super._();
  @override
  WorkQueue rebuild(void Function(WorkQueueBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WorkQueueBuilder toBuilder() => WorkQueueBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WorkQueue &&
        crossword == other.crossword &&
        locationsToTry == other.locationsToTry &&
        badLocations == other.badLocations &&
        candidateWords == other.candidateWords;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, crossword.hashCode);
    _$hash = $jc(_$hash, locationsToTry.hashCode);
    _$hash = $jc(_$hash, badLocations.hashCode);
    _$hash = $jc(_$hash, candidateWords.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'WorkQueue')
          ..add('crossword', crossword)
          ..add('locationsToTry', locationsToTry)
          ..add('badLocations', badLocations)
          ..add('candidateWords', candidateWords))
        .toString();
  }
}

class WorkQueueBuilder implements Builder<WorkQueue, WorkQueueBuilder> {
  _$WorkQueue? _$v;

  CrosswordBuilder? _crossword;
  CrosswordBuilder get crossword => _$this._crossword ??= CrosswordBuilder();
  set crossword(CrosswordBuilder? crossword) => _$this._crossword = crossword;

  MapBuilder<Location, Direction>? _locationsToTry;
  MapBuilder<Location, Direction> get locationsToTry =>
      _$this._locationsToTry ??= MapBuilder<Location, Direction>();
  set locationsToTry(MapBuilder<Location, Direction>? locationsToTry) =>
      _$this._locationsToTry = locationsToTry;

  SetBuilder<Location>? _badLocations;
  SetBuilder<Location> get badLocations =>
      _$this._badLocations ??= SetBuilder<Location>();
  set badLocations(SetBuilder<Location>? badLocations) =>
      _$this._badLocations = badLocations;

  SetBuilder<String>? _candidateWords;
  SetBuilder<String> get candidateWords =>
      _$this._candidateWords ??= SetBuilder<String>();
  set candidateWords(SetBuilder<String>? candidateWords) =>
      _$this._candidateWords = candidateWords;

  WorkQueueBuilder();

  WorkQueueBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _crossword = $v.crossword.toBuilder();
      _locationsToTry = $v.locationsToTry.toBuilder();
      _badLocations = $v.badLocations.toBuilder();
      _candidateWords = $v.candidateWords.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WorkQueue other) {
    _$v = other as _$WorkQueue;
  }

  @override
  void update(void Function(WorkQueueBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  WorkQueue build() => _build();

  _$WorkQueue _build() {
    _$WorkQueue _$result;
    try {
      _$result =
          _$v ??
          _$WorkQueue._(
            crossword: crossword.build(),
            locationsToTry: locationsToTry.build(),
            badLocations: badLocations.build(),
            candidateWords: candidateWords.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'crossword';
        crossword.build();
        _$failedField = 'locationsToTry';
        locationsToTry.build();
        _$failedField = 'badLocations';
        badLocations.build();
        _$failedField = 'candidateWords';
        candidateWords.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
          r'WorkQueue',
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
