import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'location.g.dart';

abstract class Location implements Built<Location, LocationBuilder> {
  Location._();

  static Serializer<Location> get serializer => _$locationSerializer;

  int get x;

  int get y;

  Location get left => rebuild((b) => b.x = x - 1);

  Location get right => rebuild((b) => b.x = x + 1);

  Location get up => rebuild((b) => b.y = y - 1);

  Location get down => rebuild((b) => b.y = y + 1);

  Location leftOffset(int offset) => rebuild((b) => b.x = x - offset);

  Location rightOffset(int offset) => rebuild((b) => b.x = x + offset);

  Location upOffset(int offset) => rebuild((b) => b.y = y - offset);

  Location downOffset(int offset) => rebuild((b) => b.y = y + offset);

  String prettyPrint() => '($x, $y)';

  // Returns a new location built from [updates]. Both [x] and [y] are required
  // to be non-null.
  factory Location([void Function(LocationBuilder)? updates]) = _$Location;

  // Returns a location at the given coordinates.
  factory Location.at(int x, int y) => Location(
    (b) => b
      ..x = x
      ..y = y,
  );
}
