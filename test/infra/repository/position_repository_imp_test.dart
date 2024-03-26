import 'dart:convert';
import 'package:check_weather/domain/entity/address.dart';
import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/entity/route_entity.dart';
import 'package:check_weather/domain/entity/weather.dart';
import 'package:check_weather/domain/entity/weather_theme.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/infra/data/datasource/azure_data_source.dart';
import 'package:check_weather/infra/data/model/route_directions/route_directions.dart';
import 'package:check_weather/infra/data/model/search_address/search_address.dart';
import 'package:check_weather/infra/data/model/weather_route/weather_route.dart';
import 'package:check_weather/infra/repository/position_repository_imp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

import '../mocks/route_directions_mock.dart';
import '../mocks/search_address_mock.dart';
import '../mocks/weather_route_mock.dart';

class AzureDataSourceMock extends Mock implements AzureDataSource {}

class ClientMock extends Mock implements Client {}

void main() {
  GetIt.instance.registerLazySingleton<Client>(() => ClientMock());
  GetIt.instance
      .registerLazySingleton<AzureDataSource>(() => AzureDataSourceMock());

  setUpAll(() async {
    registerFallbackValue(AzureDataSourceMock());
    registerFallbackValue(ClientMock());
  });

  group("given the call of getWeatherByRoute", () {
    final azureDataSource = GetIt.instance<AzureDataSource>();
    final positionRepository = PositionRepositoryImpl();
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

  group("given the call of getRoute", () {
    final azureDataSource = GetIt.instance<AzureDataSource>();
    final positionRepository = PositionRepositoryImpl();
    when(() => azureDataSource.getRouteDirections(any())).thenAnswer((_) async {
      return RouteDirectionsModel.fromJSON(
          jsonDecode(routeDirectionsMocksJson));
    });

    GetPositionsRequest request = const GetPositionsRequest(
        startPosition: Position(lat: 1.23, lon: 3.21),
        endPosition: Position(lat: -1.23, lon: -3.21));

    test("should call azure getRouteDirections with correct params", () async {
      await positionRepository.getRoute(request);

      verify(() => azureDataSource.getRouteDirections('1.23,3.21:-1.23,-3.21'))
          .called(1);
    });

    test("should return a RouteEntity", () async {
      final result = await positionRepository.getRoute(request);

      expect(result, isA<RouteEntity>());
      expect(result.route.lengthInMeters, 435309);
    });
  });

  group("given the call of getAddress", () {
    final azureDataSource = GetIt.instance<AzureDataSource>();
    final positionRepository = PositionRepositoryImpl();
    when(() => azureDataSource.searchAddress(any())).thenAnswer((_) async {
      return SearchAddressModel.fromJSON(jsonDecode(searchAddressMock));
    });

    String request = "Maringa,Parana,Brasil";

    test("should call azure searchAddress with correct params", () async {
      await positionRepository.getAddress(request);

      verify(() => azureDataSource.searchAddress(request)).called(1);
    });

    test("should return a AddressEntity", () async {
      final result = await positionRepository.getAddress(request);

      expect(result, isA<AddressEntity>());
      expect(result.position.lat, -23.42732);
    });
  });
}
