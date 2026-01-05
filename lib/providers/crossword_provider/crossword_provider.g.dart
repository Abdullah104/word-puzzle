// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crossword_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(crossword)
final crosswordProvider = CrosswordProvider._();

final class CrosswordProvider
    extends
        $FunctionalProvider<AsyncValue<Crossword>, Crossword, Stream<Crossword>>
    with $FutureModifier<Crossword>, $StreamProvider<Crossword> {
  CrosswordProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'crosswordProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$crosswordHash();

  @$internal
  @override
  $StreamProviderElement<Crossword> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Crossword> create(Ref ref) {
    return crossword(ref);
  }
}

String _$crosswordHash() => r'b6ad3e20ca5863ae8f691b6b461c3f80879f3d6c';
