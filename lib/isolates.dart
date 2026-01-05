import 'dart:math';

import 'package:built_collection/built_collection.dart';
import 'package:flutter/foundation.dart';
import 'package:word_puzzle/models/crossword/crossword.dart';
import 'package:word_puzzle/models/location/location.dart';
import 'package:word_puzzle/utils.dart';

import 'models/direction.dart';

final _random = Random();

Stream<Crossword> exploreCrosswordSolutions({
  required Crossword crossword,
  required BuiltSet<String> wordList,
}) async* {
  while (crossword.characters.length <
      crossword.width * crossword.height * .8) {
    final word = wordList.randomElement();
    final Direction direction = _random.nextBool() ? .across : .down;

    final location = Location.at(
      _random.nextInt(crossword.width),
      _random.nextInt(crossword.height),
    );

    try {
      var candidate = await compute(((String, Direction, Location) wordToAdd) {
        final (word, direction, location) = wordToAdd;

        return crossword.addWord(
          location: location,
          word: word,
          direction: direction,
        );
      }, (word, direction, location));

      if (candidate != null) {
        crossword = candidate;

        yield crossword;
      }
    } catch (e) {
      debugPrint('Error running isolate: $e');
    }
  }
}
