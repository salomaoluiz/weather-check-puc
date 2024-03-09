import 'package:check_weather/domain/entity/weather_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Should return the correct icon name based on code", () {
    const iconByWeatherStatus = {
      WeatherStatus.sunny: 'weather_sunny',
      WeatherStatus.partlyCloudy: 'weather_partly_cloudy',
      WeatherStatus.hazy: 'weather_hazy',
      WeatherStatus.cloudy: 'weather_cloudy',
      WeatherStatus.fog: 'weather_fog',
      WeatherStatus.pouring: 'weather_pouring',
      WeatherStatus.partlyRainy: 'weather_partly_rainy',
      WeatherStatus.lightning: 'weather_lightning',
      WeatherStatus.partlyLightning: 'weather_partly_lightning',
      WeatherStatus.rainy: 'weather_rainy',
      WeatherStatus.hail: 'weather_hail',
      WeatherStatus.partlySnowy: 'weather_partly_snowy',
      WeatherStatus.snowy: 'weather_snowy',
      WeatherStatus.snowyHeavy: 'weather_snowy_heavy',
      WeatherStatus.snowyRainy: 'weather_snowy_rainy',
      WeatherStatus.hot: 'weather_sunny_alert',
      WeatherStatus.cold: 'snowflake_alert',
      WeatherStatus.windy: 'weather_windy',
      WeatherStatus.night: 'weather_night',
      WeatherStatus.nightPartlyCloudy: 'weather_night_partly_cloudy',
    };

    for (var weatherStatus in iconByWeatherStatus.keys) {
      test(
          "for $weatherStatus should return ${iconByWeatherStatus[weatherStatus]}",
          () {
        final icon =
            WeatherThemeEntity(status: weatherStatus).getIconBasedOnIconCode();
        expect(icon, iconByWeatherStatus[weatherStatus]);
      });
    }

    test("should return the icon information for any other code", () {
      final icon =
          const WeatherThemeEntity(status: null).getIconBasedOnIconCode();
      expect(icon, WeatherIcons.defaultIcon.name);
    });
  });
}
