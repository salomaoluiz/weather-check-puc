import 'package:flutter/material.dart';

enum WeatherThemeColors {
  dayRaining(Color.fromRGBO(125, 159, 176, 1)),
  dayClear(Color.fromRGBO(255, 103, 0, 1)),
  dayFoggy(Color.fromRGBO(212, 212, 212, 1)),
  nightRaining(Color.fromRGBO(17, 72, 122, 1)),
  nightClear(Color.fromRGBO(2, 1, 44, 1));

  final Color color;

  const WeatherThemeColors(this.color);
}

enum WeatherStatus {
  sunny,
  partlyCloudy,
  hazy,
  cloudy,
  fog,
  pouring,
  partlyRainy,
  lightning,
  partlyLightning,
  rainy,
  hail,
  partlySnowy,
  snowy,
  snowyHeavy,
  snowyRainy,
  hot,
  cold,
  windy,
  night,
  nightPartlyCloudy
}

enum WeatherIcons {
  weatherSunny(WeatherStatus.sunny, 'weather_sunny'),
  weatherPartlyCloudy(WeatherStatus.partlyCloudy, 'weather_partly_cloudy'),
  weatherHazy(WeatherStatus.hazy, 'weather_hazy'),
  weatherCloudy(WeatherStatus.cloudy, 'weather_cloudy'),
  weatherFog(WeatherStatus.fog, 'weather_fog'),
  weatherPouring(WeatherStatus.pouring, 'weather_pouring'),
  weatherPartlyRainy(WeatherStatus.partlyRainy, 'weather_partly_rainy'),
  weatherLightning(WeatherStatus.lightning, 'weather_lightning'),
  weatherPartlyLightning(
      WeatherStatus.partlyLightning, 'weather_partly_lightning'),
  weatherRainy(WeatherStatus.rainy, 'weather_rainy'),
  weatherHail(WeatherStatus.hail, 'weather_hail'),
  weatherPartlySnowy(WeatherStatus.partlySnowy, 'weather_partly_snowy'),
  weatherSnowy(WeatherStatus.snowy, 'weather_snowy'),
  weatherSnowyHeavy(WeatherStatus.snowyHeavy, 'weather_snowy_heavy'),
  weatherSnowyRainy(WeatherStatus.snowyRainy, 'weather_snowy_rainy'),
  weatherSunnyAlert(WeatherStatus.hot, 'weather_sunny_alert'),
  snowflakeAlert(WeatherStatus.cold, 'snowflake_alert'),
  weatherWindy(WeatherStatus.windy, 'weather_windy'),
  weatherNight(WeatherStatus.night, 'weather_night'),
  weatherNightPartlyCloudy(
      WeatherStatus.nightPartlyCloudy, 'weather_night_partly_cloudy'),
  defaultIcon(null, 'information');

  final String name;
  final WeatherStatus? status;

  const WeatherIcons(this.status, this.name);
}

class WeatherThemeEntity {
  final WeatherStatus? status;

  const WeatherThemeEntity({this.status});

  Color getThemeColor() {
    switch (status) {
      case WeatherStatus.sunny:
      case WeatherStatus.hot:
      case WeatherStatus.windy:
        return WeatherThemeColors.dayClear.color;
      case WeatherStatus.partlyCloudy:
      case WeatherStatus.hazy:
      case WeatherStatus.cloudy:
      case WeatherStatus.fog:
        return WeatherThemeColors.dayFoggy.color;
      case WeatherStatus.pouring:
      case WeatherStatus.partlyRainy:
      case WeatherStatus.lightning:
      case WeatherStatus.partlyLightning:
      case WeatherStatus.rainy:
      case WeatherStatus.hail:
      case WeatherStatus.partlySnowy:
      case WeatherStatus.snowy:
      case WeatherStatus.snowyHeavy:
      case WeatherStatus.snowyRainy:
      case WeatherStatus.cold:
        return WeatherThemeColors.dayRaining.color;
      case WeatherStatus.night:
        return WeatherThemeColors.nightClear.color;
      case WeatherStatus.nightPartlyCloudy:
        return WeatherThemeColors.nightRaining.color;
      default:
        return WeatherThemeColors.dayClear.color;
    }
  }

  Color getThemeTextColor() {
    switch (status) {
      case WeatherStatus.sunny:
      case WeatherStatus.hot:
      case WeatherStatus.windy:
      case WeatherStatus.partlyCloudy:
      case WeatherStatus.hazy:
      case WeatherStatus.cloudy:
      case WeatherStatus.fog:
      case WeatherStatus.pouring:
      case WeatherStatus.partlyRainy:
      case WeatherStatus.lightning:
      case WeatherStatus.partlyLightning:
      case WeatherStatus.rainy:
      case WeatherStatus.hail:
      case WeatherStatus.partlySnowy:
      case WeatherStatus.snowy:
      case WeatherStatus.snowyHeavy:
      case WeatherStatus.snowyRainy:
      case WeatherStatus.cold:
        return Colors.black;
      case WeatherStatus.night:
      case WeatherStatus.nightPartlyCloudy:
        return Colors.white;
      default:
        return Colors.black;
    }
  }

  String getIconBasedOnIconCode() {
    WeatherIcons? iconBasedOnCode;

    for (var icon in WeatherIcons.values) {
      if (icon.status == status) {
        iconBasedOnCode = icon;
      }
    }

    if (iconBasedOnCode != null) {
      return iconBasedOnCode.name;
    }

    return WeatherIcons.defaultIcon.name;
  }
}
