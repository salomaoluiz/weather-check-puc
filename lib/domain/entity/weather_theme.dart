import 'package:check_weather/infra/data/model/weather_route/weather_status.dart';

enum WeatherThemeOptions {
  dayRaining,
  dayClear,
  dayFoggy,
  nightRaining,
  nightClear,
  nightFoggy
}

const dayRainingColor = "#7D9FB0";
const dayClearColor = "#FF6700";
const dayFoggyColor = "#D4D4D4";
const nightRainingColor = "#11487A";
const nightClearColor = "#02012C";
const nightFoggyColor = "#B6C0C9";

enum WeatherIcons {
  weatherSunny(WeatherStatusByIconCode.sunny, 'weather_sunny'),
  weatherPartlyCloudy(WeatherStatusByIconCode.partlyCloudy, 'weather_partly_cloudy'),
  weatherHazy(WeatherStatusByIconCode.hazy, 'weather_hazy'),
  weatherCloudy(WeatherStatusByIconCode.cloudy, 'weather_cloudy'),
  weatherFog(WeatherStatusByIconCode.fog, 'weather_fog'),
  weatherPouring(WeatherStatusByIconCode.pouring, 'weather_pouring'),
  weatherPartlyRainy(WeatherStatusByIconCode.partlyRainy, 'weather_partly_rainy'),
  weatherLightning(WeatherStatusByIconCode.lightning, 'weather_lightning'),
  weatherPartlyLightning(WeatherStatusByIconCode.partlyLightning, 'weather_partly_lightning'),
  weatherRainy(WeatherStatusByIconCode.rainy, 'weather_rainy'),
  weatherHail(WeatherStatusByIconCode.hail, 'weather_hail'),
  weatherPartlySnowy(WeatherStatusByIconCode.partlySnowy, 'weather_partly_snowy'),
  weatherSnowy(WeatherStatusByIconCode.snowy, 'weather_snowy'),
  weatherSnowyHeavy(WeatherStatusByIconCode.snowyHeavy, 'weather_snowy_heavy'),
  weatherSnowyRainy(WeatherStatusByIconCode.snowyRainy, 'weather_snowy_rainy'),
  weatherSunnyAlert(WeatherStatusByIconCode.hot, 'weather_sunny_alert'),
  snowflakeAlert(WeatherStatusByIconCode.cold, 'snowflake_alert'),
  weatherWindy(WeatherStatusByIconCode.windy, 'weather_windy'),
  weatherNight(WeatherStatusByIconCode.night, 'weather_night'),
  weatherNightPartlyCloudy(WeatherStatusByIconCode.nightPartlyCloudy, 'weather_night_partly_cloudy'),
  defaultIcon(null, 'information');

  final String name;
  final WeatherStatusByIconCode? status;

  const WeatherIcons(this.status, this.name);
}

class WeatherThemeEntity {
  const WeatherThemeEntity({required this.theme});

  final WeatherThemeOptions theme;

  String getThemeColor() {
    switch (theme) {
      case WeatherThemeOptions.dayRaining:
        return dayRainingColor;
      case WeatherThemeOptions.dayClear:
        return dayClearColor;
      case WeatherThemeOptions.dayFoggy:
        return dayFoggyColor;
      case WeatherThemeOptions.nightRaining:
        return nightRainingColor;
      case WeatherThemeOptions.nightClear:
        return nightClearColor;
      case WeatherThemeOptions.nightFoggy:
        return nightFoggyColor;
    }
  }

  static String getIconBasedOnIconCode(WeatherStatusByIconCode? weatherStatus) {
    WeatherIcons? iconBasedOnCode;

    for(var icon in WeatherIcons.values) {
      if(icon.status == weatherStatus) {
        iconBasedOnCode = icon;
      }
    }

    if(iconBasedOnCode != null) {
      return iconBasedOnCode.name;
    }

    return WeatherIcons.defaultIcon.name;
  }
}
