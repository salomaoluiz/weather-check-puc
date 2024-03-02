part of 'weather_route.dart';

class WaypointTemperature {
  double value;
  String unit;

  WaypointTemperature({required this.value, required this.unit});

  factory WaypointTemperature.fromJSON(Map<String, dynamic> json) {
    return WaypointTemperature(value: json['value'], unit: json['unit']);
  }
}
