import 'package:check_weather/domain/entity/position.dart';
import 'package:check_weather/domain/entity/weather.dart';

class PositionEntity {
  const PositionEntity({required this.position, required this.weather});

  final Position position;
  final Weather weather;
}
