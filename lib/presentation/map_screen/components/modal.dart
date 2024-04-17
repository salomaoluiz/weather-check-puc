import 'package:check_weather/domain/entity/travel_weather_entity.dart';
import 'package:check_weather/presentation/map_screen/components/modal_item.dart';
import 'package:check_weather/presentation/utils/community_icons.dart';
import 'package:flutter/material.dart';

class WeatherModal extends StatelessWidget {
  final TravelWeatherEntity travelWeatherEntity;

  const WeatherModal({super.key, required this.travelWeatherEntity});

  @override
  Widget build(BuildContext context) {
    var iconFromString = CommunityIconsFromString.values.firstWhere((element) =>
        element.name ==
        travelWeatherEntity.weather.theme.getIconBasedOnIconCode());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ModalItem(
                title: "Precipitação",
                value: travelWeatherEntity.weather.precipitation.toString(),
                unit: travelWeatherEntity.weather.precipitationType,
                textColor:
                    travelWeatherEntity.weather.theme.getThemeTextColor(),
              ),
              ModalItem(
                title: "Temperatura",
                value: travelWeatherEntity.weather.temperature.toString(),
                unit: travelWeatherEntity.weather.temperatureUnit,
                textColor:
                    travelWeatherEntity.weather.theme.getThemeTextColor(),
              ),
            ],
          ),
          Icon(
            iconFromString.icon,
            size: 89,
            color: travelWeatherEntity.weather.theme.getThemeTextColor(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ModalItem(
                title: "Velocidade do vento",
                value: travelWeatherEntity.weather.windSpeed.toString(),
                unit: travelWeatherEntity.weather.windSpeedUnit,
                textColor:
                    travelWeatherEntity.weather.theme.getThemeTextColor(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
