part 'precipitation.dart';

part 'wind.dart';

part 'temperature.dart';

class Waypoint {
  WaypointTemperature temperature;
  WaypointWind wind;
  WaypointPrecipitation precipitation;

  Waypoint(
      {required this.temperature,
      required this.precipitation,
      required this.wind});

  factory Waypoint.fromJSON(Map<String, dynamic> json) {
    return Waypoint(
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