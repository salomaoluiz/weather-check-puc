import 'dart:convert';

import 'package:check_weather/infra/data/model/route_directions/route_directions.dart';
import 'package:check_weather/infra/data/model/weather_route/weather_route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';

class GetRouteDirectionsParamethers {
  String position;

  GetRouteDirectionsParamethers({required this.position});
}

class AzureDataSource {
  Client httpClient;

  AzureDataSource({required this.httpClient});

  Future<RouteDirectionsModel> getRouteDirections(
      GetRouteDirectionsParamethers paramethers) async {
    final queryParamethers = {
      'api-version': '1.0',
      'query': paramethers.position,
      'subscription-key': dotenv.get('SUBSCRIPTION-KEY'),
      'computeTravelTimeFor': 'all',
      'computeBestOrder': 'true',
      'routeType': 'shortest',
      'instructionsType': 'tagged',
      'sectionType': 'travelMode'
    };

    var url = Uri.https(
        'atlas.microsoft.com', 'route/directions/json', queryParamethers);

    var result = await httpClient.get(url);

    return RouteDirectionsModel.fromJSON(jsonDecode(result.body));
  }

  Future<WeatherRouteModel> getWeatherRoute(String position) async {
    final queryParamethers = {
      'api-version': '1.1',
      'query': position,
      'subscription-key': dotenv.get('SUBSCRIPTION-KEY'),
      'language': 'pt-BR',
    };

    var url = Uri.https(
        'atlas.microsoft.com', 'weather/route/json', queryParamethers);

    var result = await httpClient.get(url);

    return WeatherRouteModel.fromJSON(jsonDecode(result.body));
  }
}