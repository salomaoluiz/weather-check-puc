import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';

enum CommunityIconsFromString {
  weatherSunny('weather_sunny', CommunityMaterialIcons.weather_sunny),
  weatherPartlyCloudy(
      'weather_partly_cloudy', CommunityMaterialIcons.weather_partly_cloudy),
  weatherHazy('weather_hazy', CommunityMaterialIcons.weather_hazy),
  weatherCloudy('weather_cloudy', CommunityMaterialIcons.weather_cloudy),
  weatherFog('weather_fog', CommunityMaterialIcons.weather_fog),
  weatherPouring('weather_pouring', CommunityMaterialIcons.weather_pouring),
  weatherPartlyRainy(
      'weather_partly_rainy', CommunityMaterialIcons.weather_partly_rainy),
  weatherLightning(
      'weather_lightning', CommunityMaterialIcons.weather_lightning),
  weatherPartlyLightning('weather_partly_lightning',
      CommunityMaterialIcons.weather_partly_lightning),
  weatherRainy('weather_rainy', CommunityMaterialIcons.weather_rainy),
  weatherHail('weather_hail', CommunityMaterialIcons.weather_hail),
  weatherPartlySnowy(
      'weather_partly_snowy', CommunityMaterialIcons.weather_partly_snowy),
  weatherSnowy('weather_snowy', CommunityMaterialIcons.weather_snowy),
  weatherSnowyHeavy(
      'weather_snowy_heavy', CommunityMaterialIcons.weather_snowy_heavy),
  weatherSnowyRainy(
      'weather_snowy_rainy', CommunityMaterialIcons.weather_snowy_rainy),
  weatherSunnyAlert(
      'weather_sunny_alert', CommunityMaterialIcons.weather_sunny_alert),
  snowflakeAlert('snowflake_alert', CommunityMaterialIcons.snowflake_alert),
  weatherWindy('weather_windy', CommunityMaterialIcons.weather_windy),
  weatherNight('weather_night', CommunityMaterialIcons.weather_night),
  weatherNightPartlyCloudy('weather_night_partly_cloudy',
      CommunityMaterialIcons.weather_night_partly_cloudy),
  information('information', CommunityMaterialIcons.information);

  final String? name;
  final IconData   icon;

  const CommunityIconsFromString(this.name, this.icon);
}
