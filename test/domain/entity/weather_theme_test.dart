import 'package:check_weather/domain/entity/weather_theme.dart';
import 'package:check_weather/infra/data/model/weather_route/weather_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Should return the correct icon name based on code", () {
    const iconByWeatherStatus = {
      WeatherStatusByIconCode.sunny:'weather_sunny',
      WeatherStatusByIconCode.partlyCloudy:'weather_partly_cloudy',
      WeatherStatusByIconCode.hazy:'weather_hazy',
      WeatherStatusByIconCode.cloudy:'weather_cloudy',
      WeatherStatusByIconCode.fog:'weather_fog',
      WeatherStatusByIconCode.pouring:'weather_pouring',
      WeatherStatusByIconCode.partlyRainy:'weather_partly_rainy',
      WeatherStatusByIconCode.lightning:'weather_lightning',
      WeatherStatusByIconCode.partlyLightning:'weather_partly_lightning',
      WeatherStatusByIconCode.rainy:'weather_rainy',
      WeatherStatusByIconCode.hail:'weather_hail',
      WeatherStatusByIconCode.partlySnowy:'weather_partly_snowy',
      WeatherStatusByIconCode.snowy:'',
      WeatherStatusByIconCode.snowyHeavy:'weather_snowy_heavy',
      WeatherStatusByIconCode.snowyRainy:'weather_snowy_rainy',
      WeatherStatusByIconCode.hot:'weather_sunny_alert',
      WeatherStatusByIconCode.cold:'snowflake_alert',
      WeatherStatusByIconCode.windy:'weather_windy',
      WeatherStatusByIconCode.night:'weather_night',
      WeatherStatusByIconCode.nightPartlyCloudy:'weather_night_partly_cloudy',
    };

    for (var weatherStatus in iconByWeatherStatus.keys) {
      test("for $weatherStatus should return ${iconByWeatherStatus[weatherStatus]}", () {
        final icon = WeatherThemeEntity.getIconBasedOnIconCode(weatherStatus);
        expect(icon, iconByWeatherStatus[weatherStatus]);
      });
    }

    test("should return the icon information for any other code", () {
      final icon = WeatherThemeEntity.getIconBasedOnIconCode(null);
      expect(icon, WeatherIcons.defaultIcon.name);
    });
  });
}
