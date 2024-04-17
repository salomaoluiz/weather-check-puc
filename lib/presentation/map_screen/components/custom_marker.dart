import 'package:check_weather/domain/entity/travel_weather_entity.dart';
import 'package:check_weather/presentation/map_screen/components/modal.dart';
import 'package:check_weather/presentation/utils/community_icons.dart';
import 'package:flutter/material.dart';

class CustomMarker extends StatefulWidget {
  final TravelWeatherEntity travelWeatherEntity;

  const CustomMarker({super.key, required this.travelWeatherEntity});

  @override
  State<CustomMarker> createState() => _CustomMarkerState();
}

class _CustomMarkerState extends State<CustomMarker> {
  _showDetailsModal() {
    showModalBottomSheet(
        context: context,
        backgroundColor:
            widget.travelWeatherEntity.weather.theme.getThemeColor(),
        builder: (ctx) {
          return WeatherModal(
            travelWeatherEntity: widget.travelWeatherEntity,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var iconFromString = CommunityIconsFromString.values.firstWhere((element) =>
        element.name ==
        widget.travelWeatherEntity.weather.theme.getIconBasedOnIconCode());

    return GestureDetector(
      onTap: _showDetailsModal,
      child: Container(
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
                  color: widget.travelWeatherEntity.weather.theme
                      .getThemeTextColor(),
                )),
            Positioned(
                bottom: 0,
                child: Container(
                    alignment: Alignment.topRight,
                    child: Text(
                      "${widget.travelWeatherEntity.weather.temperature} ${widget.travelWeatherEntity.weather.temperatureUnit}",
                      style: TextStyle(
                          color: widget.travelWeatherEntity.weather.theme
                              .getThemeTextColor(),
                          fontWeight: FontWeight.bold),
                    )))
          ],
        ),
      ),
    );
  }
}
