import 'package:check_weather/infra/data/model/weather_route/weather_status.dart';

part 'precipitation.dart';

part 'wind.dart';

part 'temperature.dart';

class Waypoint {
  WeatherStatusModel weatherStatus;
  WaypointTemperature temperature;
  WaypointWind wind;
  WaypointPrecipitation precipitation;

  Waypoint(
      {required this.weatherStatus,
      required this.temperature,
      required this.precipitation,
      required this.wind});

  factory Waypoint.fromJSON(Map<String, dynamic> json) {
    return Waypoint(
        weatherStatus: WeatherStatusModel.fromJSON(json),
        temperature: WaypointTemperature.fromJSON(json['temperature']),
        precipitation: WaypointPrecipitation.fromJSON(json['precipitation']),
        wind: WaypointWind.fromJSON(json['wind']));
  }
}

class WeatherRouteModel {
  List<Waypoint> waypoints = [];

  WeatherRouteModel({required this.waypoints});

  factory WeatherRouteModel.fromJSON(Map<String, dynamic> json) {
    return WeatherRouteModel(
        waypoints: List<Waypoint>.from(
            json['waypoints'].map((waypoint) => Waypoint.fromJSON(waypoint))));
  }
}
