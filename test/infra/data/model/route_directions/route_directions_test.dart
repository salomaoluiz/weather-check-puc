import 'dart:convert';

import 'package:check_weather/infra/data/model/route_directions/route_directions.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/route_directions_mock.dart';


void main() {
  test("should construct the model based on json", () {
    RouteDirectionsModel routeDirectionsModel = RouteDirectionsModel.fromJSON(jsonDecode(routeDirectionsMocksJson));

    expect(routeDirectionsModel.routes[0].summary.lengthInMeters, 435309);
    expect(routeDirectionsModel.routes[0].guidance.instructions[1].routeOffsetInMeters, 32);
    expect(routeDirectionsModel.routes[0].guidance.instructions[1].travelTimeInSeconds, 3);
    expect(routeDirectionsModel.routes[0].guidance.instructions[1].point.longitude, -51.92679);
    expect(routeDirectionsModel.routes[0].guidance.instructions[1].point.latitude, -23.39768);
  });
}
