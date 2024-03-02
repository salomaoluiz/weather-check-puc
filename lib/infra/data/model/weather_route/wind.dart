part of 'weather_route.dart';

class WaypointWindSpeed {
  double value;
  String unit;

  WaypointWindSpeed({required this.value, required this.unit});

  factory WaypointWindSpeed.fromJSON(Map<String, dynamic> json) {
    return WaypointWindSpeed(value: json['value'], unit: json['unit']);
  }
}

class WaypointWind {
  WaypointWindSpeed speed;

  WaypointWind({required this.speed});

  factory WaypointWind.fromJSON(Map<String, dynamic> json) {
    return WaypointWind(speed: WaypointWindSpeed.fromJSON(json['speed']));
  }
}
