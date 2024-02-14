import 'package:check_weather/domain/entity/weather_theme_entity.dart';
import 'package:equatable/equatable.dart';

class PositionWeatherEntity extends Equatable {
  const PositionWeatherEntity(
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

  @override
  List<Object?> get props => <Object?>[
        temperature,
        temperatureUnit,
        windSpeed,
        windSpeedUnit,
        precipitation,
        precipitationType,
        theme
      ];
}
