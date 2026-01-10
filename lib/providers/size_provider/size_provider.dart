import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'size_provider.g.dart';

enum CrosswordSize {
  small(width: 20, height: 11),
  medium(width: 40, height: 22),
  large(width: 80, height: 44),
  xlarge(width: 160, height: 88),
  xxlarge(width: 500, height: 500);

  const CrosswordSize({required this.width, required this.height});

  final int width;
  final int height;

  String get label => '$width x $height';
}

/// A provider that holds the current size of the crossword to generate.
@Riverpod(keepAlive: true)
class Size extends _$Size {
  CrosswordSize _size = .large;

  @override
  CrosswordSize build() => _size;

  void setSize(CrosswordSize size) {
    _size = size;

    ref.invalidateSelf();
  }
}
