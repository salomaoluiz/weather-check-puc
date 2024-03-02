part of 'routes.dart';

class Point {
  double latitude;
  double longitude;

  Point({required this.latitude, required this.longitude});

  factory Point.fromJSON(Map<String, dynamic> json) {
    return Point(latitude: json['latitude'], longitude: json['longitude']);
  }
}

class Instructions {
  Point point;
  int travelTimeInSeconds;
  int routeOffsetInMeters;

  Instructions(
      {required this.point,
      required this.travelTimeInSeconds,
      required this.routeOffsetInMeters});

  factory Instructions.fromJSON(Map<String, dynamic> json) {
    return Instructions(
        point: Point.fromJSON(json['point']),
        travelTimeInSeconds: json['travelTimeInSeconds'],
        routeOffsetInMeters: json['routeOffsetInMeters']);
  }
}

class Guidance {
  List<Instructions> instructions = [];

  Guidance({required this.instructions});

  factory Guidance.fromJSON(Map<String, dynamic> json) {
    return Guidance(
        instructions: List<Instructions>.from(json['instructions']
            .map((instructionJson) => Instructions.fromJSON(instructionJson))));
  }
}
