import 'dart:convert';
import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/entity/weather.dart';
import 'package:check_weather/domain/entity/weather_theme.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/infra/data/datasource/azure_data_source.dart';
import 'package:check_weather/infra/data/model/weather_route/weather_route.dart';
import 'package:check_weather/infra/repository/position_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/weather_route_mock.dart';

class AzureDataSourceMock extends Mock implements AzureDataSource {}

class ClientMock extends Mock implements Client {}

void main() {
  setUpAll(() {
    registerFallbackValue(AzureDataSourceMock());
    registerFallbackValue(ClientMock());
  });
  group("given the call of getWeatherByRoute", () {
    final azureDataSource = AzureDataSourceMock();
    final positionRepository = PositionRepositoryImpl(azureDataSource);
    when(() => azureDataSource.getWeatherRoute(any())).thenAnswer((_) async {
      return WeatherRouteModel.fromJSON(jsonDecode(weatherRouteMock));
    });
    GetWeatherByPositionsRequest request = GetWeatherByPositionsRequest(
        positions: List.from([
      const PositionEntity(
          latitude: 1.23, longitude: -3.21, travelTimeInSeconds: 200)
    ]));

    test(
        "should call the getWeatherRoute from azureDataSource with correct params",
        () async {
      await positionRepository.getWeatherByRoute(request);

      verify(() => azureDataSource.getWeatherRoute('1.23,-3.21,3')).called(1);
    });

    test("should return an WeatherEntity", () async {
      final result = await positionRepository.getWeatherByRoute(request);

      expect(result, isA<List<WeatherEntity>>());
      expect(result.first.temperature, 4.8);
      expect(result.first.temperatureUnit, 'C');
      expect(result.first.precipitation, 0.0);
      expect(result.first.precipitationType, 'RAIN');
      expect(result.first.theme.status, WeatherStatus.fog);
      expect(result.first.windSpeed, 10.0);
      expect(result.first.windSpeedUnit, 'km/h');
    });
  });
}
