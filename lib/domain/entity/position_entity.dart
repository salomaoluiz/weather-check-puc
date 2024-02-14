import 'package:check_weather/domain/entity/position.dart';
import 'package:check_weather/domain/entity/weather.dart';

class PositionEntity {
  const PositionEntity({this.position, this.weather});

  final Position? position;
  final Weather? weather;
}
