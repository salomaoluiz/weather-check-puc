import 'package:check_weather/infra/data/datasource/azure_data_source.dart';
import 'package:check_weather/infra/data/model/route_directions/route_directions.dart';
import 'package:check_weather/infra/data/model/weather_route/weather_route.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../mocks/route_directions_mock.dart';
import '../../mocks/weather_route_mock.dart';

class HTTPMock extends Mock implements http.Client {}

class UriMock extends Mock implements Uri {}

void main() {
  setUpAll(() async {
    await dotenv.load(fileName: '.test.env');
    registerFallbackValue(HTTPMock());
    registerFallbackValue(UriMock());
  });
  test(
      'should request the Azure API with the correct params and return a RouteDirectionsModel',
      () async {
    HTTPMock httpClient = HTTPMock();
    AzureDataSource dataSource = AzureDataSource(httpClient: httpClient);

    when(() => httpClient.get(any()))
        .thenAnswer((_) async => http.Response(routeDirectionsMocksJson, 200));

    var result = await dataSource.getRouteDirections(
        GetRouteDirectionsParamethers(
            position: "-23.397388,-51.926810:-25.454850,-49.279046"));

    final queryParamethers = {
      'api-version': '1.0',
      'query': "-23.397388,-51.926810:-25.454850,-49.279046",
      'subscription-key': "MOCKED_SUBSCRIPTION_KEY",
      'computeTravelTimeFor': 'all',
      'computeBestOrder': 'true',
      'routeType': 'shortest',
      'instructionsType': 'tagged',
      'sectionType': 'travelMode'
    };

    var url = Uri.https(
        'atlas.microsoft.com', 'route/directions/json', queryParamethers);

    verify(() => httpClient.get(url)).called(1);
    expect(result, isA<RouteDirectionsModel>());
  });

  test(
      'should request the Azure API with the correct params and return a WeatherRouteModel',
      () async {
    HTTPMock httpClient = HTTPMock();
    AzureDataSource dataSource = AzureDataSource(httpClient: httpClient);

    when(() => httpClient.get(any()))
        .thenAnswer((_) async => http.Response(weatherRouteMock, 200));

    var result = await dataSource
        .getWeatherRoute("-23.397388,-51.926810,0:-25.454850,-49.279046,0");

    final queryParamethers = {
      'api-version': '1.1',
      'query': "-23.397388,-51.926810,0:-25.454850,-49.279046,0",
      'subscription-key': "MOCKED_SUBSCRIPTION_KEY",
      'language': 'pt-BR',
    };

    var url = Uri.https(
        'atlas.microsoft.com', 'weather/route/json', queryParamethers);

    verify(() => httpClient.get(url)).called(1);
    expect(result, isA<WeatherRouteModel>());
  });
}
