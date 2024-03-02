import 'dart:convert';

import 'package:check_weather/infra/data/model/weather_route/weather_route.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/weather_route_mock.dart';

void main() {
  test("should return the the data parsed in the model", () {
    WeatherRouteModel model =
        WeatherRouteModel.fromJSON(jsonDecode(weatherRouteMock));

    expect(model.waypoints[0].precipitation.dbz, 0.0);
    expect(model.waypoints[0].precipitation.type, "RAIN");
    expect(model.waypoints[0].wind.speed.value, 10.0);
    expect(model.waypoints[0].wind.speed.unit, 'km/h');
    expect(model.waypoints[0].temperature.value, 4.8);
    expect(model.waypoints[0].temperature.unit, 'C');
  });
}
