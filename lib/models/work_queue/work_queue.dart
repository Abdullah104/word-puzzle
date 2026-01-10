import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:characters/characters.dart';
import 'package:word_puzzle/models/crossword/crossword.dart';
import 'package:word_puzzle/models/direction.dart';
import 'package:word_puzzle/models/location/location.dart';

part 'work_queue.g.dart';

/// A work queue for a worker to process.
///
/// The work queue contains a crossword and a list of locations to try,
/// along with candidate words to add to the crossword.
abstract class WorkQueue implements Built<WorkQueue, WorkQueueBuilder> {
  WorkQueue._();

  factory WorkQueue([void Function(WorkQueueBuilder)? updates]) = _$WorkQueue;

  static Serializer<WorkQueue> get serializer => _$workQueueSerializer;

  /// The crossword the worker is working on.
  Crossword get crossword;

  /// The outstanding queue of locations to try.
  BuiltMap<Location, Direction> get locationsToTry;

  /// Known bad locations.
  BuiltSet<Location> get badLocations;

  /// The list of unused candidate words that can be added to the crossword.
  BuiltSet<String> get candidateWords;

  /// Returns true if the work queue is complete.
  bool get isCompleted => locationsToTry.isEmpty || candidateWords.isEmpty;

  /// Create a work queue from a crossword.
  static WorkQueue from({
    required Crossword crossword,
    required Iterable<String> candidateWords,
    required Location startLocation,
  }) => WorkQueue((b) {
    if (crossword.words.isEmpty) {
      // Strip candidate words too long to fit in the crossword
      b.candidateWords.addAll(
        candidateWords.where(
          (word) => word.characters.length <= crossword.width,
        ),
      );

      b.crossword.replace(crossword);

      b.locationsToTry.addAll({startLocation: Direction.across});
    } else {
      // Assuming words have already been stripped to length
      b.candidateWords.addAll(
        candidateWords.toBuiltSet().rebuild(
          (b) => b.removeAll(crossword.words.map((word) => word.word)),
        ),
      );

      b.crossword.replace(crossword);

      crossword.characters
          .rebuild(
            (b) => b.removeWhere((location, character) {
              if (character.acrossWord != null && character.downWord != null) {
                return true;
              }

              final left = crossword.characters[location.left];
              if (left?.downWord != null) return true;

              final right = crossword.characters[location.right];
              if (right?.downWord != null) return true;

              final up = crossword.characters[location.up];
              if (up?.acrossWord != null) return true;

              final down = crossword.characters[location.down];
              if (down?.acrossWord != null) return true;

              return false;
            }),
          )
          .forEach((location, character) {
            b.locationsToTry.addAll({
              location: switch ((character.acrossWord, character.downWord)) {
                (null, null) => throw StateError(
                  'Character is not part of a word',
                ),
                (null, _) => Direction.across,
                (_, null) => Direction.down,
                (_, _) => throw StateError('Character is part of two words'),
              },
            });
          });
    }
  });

  WorkQueue remove(Location location) => rebuild(
    (b) => b
      ..locationsToTry.remove(location)
      ..badLocations.add(location),
  );

  /// Update the work queue from a crossword derived from the current crossword
  /// that this work queue is built from.
  WorkQueue updateFrom(final Crossword crossword) =>
      WorkQueue.from(
        crossword: crossword,
        candidateWords: candidateWords,
        startLocation: locationsToTry.isNotEmpty
            ? locationsToTry.keys.first
            : Location.at(0, 0),
      ).rebuild(
        (b) => b
          ..badLocations.addAll(badLocations)
          ..locationsToTry.removeWhere(
            (location, _) => badLocations.contains(location),
          ),
      );
}
