import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/entity/route.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should calculate the distance between two coordinates', () {
    PositionEntity initialPosition =
        const PositionEntity(latitude: -23.413967, longitude: -51.920500);

    PositionEntity finalPosition =
        const PositionEntity(latitude: -25.460345, longitude: -49.243302);

    var distance = Route.calculateDistanceInMetersByPositions(
        initialPosition, finalPosition);

    expect(distance, 353);
  });
}
