import 'package:check_weather/domain/entity/travel_weather_entity.dart';
import 'package:check_weather/presentation/utils/community_icons.dart';
import 'package:flutter/material.dart';

class Marker extends StatefulWidget {
  final TravelWeatherEntity travelWeatherEntity;

  const Marker({super.key, required this.travelWeatherEntity});

  @override
  State<Marker> createState() => _MarkerState();
}

class _MarkerState extends State<Marker> {
  @override
  Widget build(BuildContext context) {
    var iconFromString = CommunityIconsFromString.values.firstWhere((element) =>
        element.name ==
        widget.travelWeatherEntity.weather.theme.getIconBasedOnIconCode());

    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(99),
          color: widget.travelWeatherEntity.weather.theme
              .getThemeColor()
              .withAlpha(200)),
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.loose,
        children: [
          Positioned(
              top: 0,
              child: Icon(
                iconFromString.icon,
                color: Colors.white,
              )),
          Positioned(
              bottom: 0,
              child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "${widget.travelWeatherEntity.weather.temperature} ${widget.travelWeatherEntity.weather.temperatureUnit}",
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )))
        ],
      ),
    );
  }
}
