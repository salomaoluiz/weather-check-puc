import 'package:check_weather/domain/entity/weather_theme_entity.dart';

class Weather {
  const Weather(
      {this.temperature,
      this.temperatureUnit,
      this.windSpeed,
      this.windSpeedUnit,
      this.precipitation,
      this.precipitationType,
      this.theme});

  final double? temperature;
  final String? temperatureUnit;
  final double? windSpeed;
  final String? windSpeedUnit;
  final double? precipitation;
  final String? precipitationType;
  final WeatherThemeEntity? theme;
}
