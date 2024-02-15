import 'package:check_weather/domain/entity/weather_theme.dart';

class WeatherEntity {
  const WeatherEntity({
    required this.temperature,
    required this.precipitation,
    required this.precipitationType,
    required this.theme,
    this.temperatureUnit,
    this.windSpeed,
    this.windSpeedUnit,
  });

  final double temperature;
  final double precipitation;
  final String precipitationType;
  final WeatherThemeEntity theme;
  final String? temperatureUnit;
  final double? windSpeed;
  final String? windSpeedUnit;
}
