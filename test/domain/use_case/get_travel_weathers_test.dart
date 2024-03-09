import 'package:check_weather/core/infra/error_result_model.dart';
import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/entity/route.dart';
import 'package:check_weather/domain/entity/route_entity.dart';
import 'package:check_weather/domain/entity/travel_weather_entity.dart';
import 'package:check_weather/domain/entity/weather.dart';
import 'package:check_weather/domain/entity/weather_theme.dart';
import 'package:check_weather/domain/repository/position_repository.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/domain/use_case/get_travel_weathers.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class PositionRepositoryMock extends Mock implements PositionRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(PositionRepositoryMock());
    registerFallbackValue(const GetPositionsRequest());
    registerFallbackValue(const GetWeatherByPositionsRequest());
  });
  test(
      "Should return 404 with message of empty route if get route returns empty",
      () async {
    final positionRepository = PositionRepositoryMock();
    when(() => positionRepository.getRoute(any())).thenAnswer((_) async {
      return RouteEntity(
          positions: List.empty(), route: const Route(lengthInMeters: 123));
    });

    final useCase = GetTravelWeathersUseCase(positionRepository);

    const positionRequest = GetPositionsRequest(
        endPosition: Position(lat: 2222, lon: 3333),
        startPosition: Position(lat: 1111, lon: 2222));
    functionToThrow() async => useCase.call(positionRequest);

    final future = functionToThrow();
    await expectLater(
        future,
        throwsA(
            const ErrorResultModel(message: "Empty Route", statusCode: 404)));
  });

  test("Should return 500 if got something wrong on the request", () async {
    final positionRepository = PositionRepositoryMock();
    when(() => positionRepository.getRoute(any()))
        .thenThrow(UnsupportedError("Error Message"));

    final useCase = GetTravelWeathersUseCase(positionRepository);

    const positionRequest = GetPositionsRequest(
        endPosition: Position(lat: 2222, lon: 3333),
        startPosition: Position(lat: 1111, lon: 2222));
    functionToThrow() async => useCase.call(positionRequest);

    final future = functionToThrow();
    await expectLater(
        future,
        throwsA(
            const ErrorResultModel(message: "Unknown Error", statusCode: 500)));
  });

  test("should return the travel weathers if get all the information correctly",
      () async {
    final positionRepository = PositionRepositoryMock();
    const positionEntity = PositionEntity(
        latitude: 123,
        longitude: 321,
        distanceInMeters: 5000,
        travelTimeInSeconds: 200);
    const weather = WeatherEntity(
        temperature: 24.5,
        precipitation: 30,
        precipitationType: 'rain',
        theme: WeatherThemeEntity(theme: WeatherThemeOptions.dayRaining));

    when(() => positionRepository.getRoute(any())).thenAnswer((_) async {
      return RouteEntity(
          positions: List.from([positionEntity]),
          route: const Route(lengthInMeters: 123));
    });
    when(() => positionRepository.getWeatherByRoute(any()))
        .thenAnswer((_) async {
      return List.from([weather]);
    });

    final useCase = GetTravelWeathersUseCase(positionRepository);

    const positionRequest = GetPositionsRequest(
        endPosition: Position(lat: 2222, lon: 3333),
        startPosition: Position(lat: 1111, lon: 2222));

    final result = await useCase.call(positionRequest);

    expect(result, isA<List<TravelWeatherEntity>>());
    expect(result.first.weather, weather);
    expect(result.first.position, positionEntity);
  });
}
