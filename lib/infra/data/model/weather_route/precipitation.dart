part of 'weather_route.dart';

class WaypointPrecipitation {
  double dbz;
  String type;

  WaypointPrecipitation({required this.dbz, required this.type});

  factory WaypointPrecipitation.fromJSON(Map<String, dynamic> json) {
    return WaypointPrecipitation(dbz: json['dbz'], type: json['type']);
  }
}
