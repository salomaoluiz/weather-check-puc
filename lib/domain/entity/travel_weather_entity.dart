import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/entity/weather.dart';

class TravelWeatherEntity {
  const TravelWeatherEntity({required this.position, required this.weather});

  final PositionEntity position;
  final WeatherEntity weather;
}
