import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:word_puzzle/isolates.dart';

import '../../models/crossword/crossword.dart';
import '../size_provider/size_provider.dart';
import '../word_list_provider/word_list_provider.dart';

part 'crossword_provider.g.dart';

@riverpod
Stream<Crossword> crossword(Ref ref) async* {
  final size = ref.watch(sizeProvider);
  final wordListAsync = ref.watch(wordListProvider);

  final emptyCrossword = Crossword.crossword(
    width: size.width,
    height: size.height,
  );

  yield* wordListAsync.when(
    data: (wordList) => exploreCrosswordSolutions(
      crossword: emptyCrossword,
      wordList: wordList,
    ),
    error: (error, stackTrace) async* {
      debugPrint('Error loading word list: $error');
      yield emptyCrossword;
    },
    loading: () async* {
      yield emptyCrossword;
    },
  );
}
