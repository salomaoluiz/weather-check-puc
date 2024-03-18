import 'dart:math' show cos, sqrt, asin, pow, sin, pi;

import 'package:check_weather/domain/entity/position_entity.dart';

class Route {
  const Route({this.lengthInMeters});

  final int? lengthInMeters;

  static double calculateDistanceInMetersByPositions(
      PositionEntity initalPosition, PositionEntity finalPosition) {
    int earthRadius = 6371;
    final dLat = _toRadians(finalPosition.latitude - initalPosition.latitude);
    final dLon = _toRadians(finalPosition.longitude - initalPosition.longitude);
    final lat1Radians = _toRadians(initalPosition.latitude);
    final lat2Radians = _toRadians(finalPosition.latitude);

    final a =
        _haversin(dLat) + cos(lat1Radians) * cos(lat2Radians) * _haversin(dLon);
    final c = 2 * asin(sqrt(a));

    return (earthRadius * c).floorToDouble();
  }
}

double _toRadians(double degrees) => degrees * pi / 180;

num _haversin(double radians) => pow(sin(radians / 2), 2);
