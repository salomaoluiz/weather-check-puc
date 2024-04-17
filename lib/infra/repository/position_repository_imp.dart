import 'package:check_weather/di/service.dart';
import 'package:check_weather/domain/entity/address.dart';
import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/entity/route.dart';
import 'package:check_weather/domain/entity/route_entity.dart';
import 'package:check_weather/domain/entity/weather.dart';
import 'package:check_weather/domain/entity/weather_theme.dart';
import 'package:check_weather/domain/repository/position_repository.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/infra/data/datasource/azure_data_source.dart';

const minimalDistanceBetweenPositions = 50;

class PositionRepositoryImpl implements PositionRepository {
  final AzureDataSource _azureDataSource = getIt<AzureDataSource>();

  @override
  Future<List<WeatherEntity>> getWeatherByRoute(
      GetWeatherByPositionsRequest request) async {
    var position = request.positions?.map((e) {
      var timeInMinutes = (e.travelTimeInSeconds / 60).floor();
      var time = (timeInMinutes > 120) ? 120 : timeInMinutes;

      return "${e.latitude},${e.longitude},$time";
    }).join(":");

    final weatherRouteModel = await _azureDataSource.getWeatherRoute(position!);

    List<WeatherEntity> weatherEntityList =
        List.from(weatherRouteModel.waypoints.map((e) {
      WeatherThemeEntity theme =
          WeatherThemeEntity(status: e.weatherStatus.statusByIconCode?.status);

      WeatherEntity entity = WeatherEntity(
          temperature: e.temperature.value,
          precipitation: e.precipitation.dbz,
          precipitationType: e.precipitation.type,
          temperatureUnit: e.temperature.unit,
          windSpeed: e.wind.speed.value,
          windSpeedUnit: e.wind.speed.unit,
          theme: theme);

      return entity;
    }));

    return weatherEntityList;
  }

  @override
  Future<RouteEntity> getRoute(GetPositionsRequest request) async {
    String startPosition =
        "${request.startPosition?.lat},${request.startPosition?.lon}";
    String endPosition =
        "${request.endPosition?.lat},${request.endPosition?.lon}";
    String position = "$startPosition:$endPosition";

    final routeDirectionsModel =
        await _azureDataSource.getRouteDirections(position);

    final firstRoute = routeDirectionsModel.routes[0];

    Route route = Route(lengthInMeters: firstRoute.summary.lengthInMeters);
    List<PositionEntity> positions = List.from(firstRoute.guidance.instructions
        .map((instruction) => PositionEntity(
            latitude: instruction.point.latitude,
            longitude: instruction.point.longitude,
            distanceInMeters: instruction.routeOffsetInMeters,
            travelTimeInSeconds: instruction.travelTimeInSeconds)));
    var initialPosition = positions[0];
    List<PositionEntity> filteredPositions = [initialPosition];
    for (var i = 0; i < positions.length - 1; i += 2) {
      var distance = Route.calculateDistanceInMetersByPositions(
          initialPosition, positions[i]);

      if (distance > minimalDistanceBetweenPositions) {
        initialPosition = positions[i];
        filteredPositions.add(positions[i]);
      } else {
        continue;
      }
    }

    RouteEntity routeEntity =
        RouteEntity(route: route, positions: filteredPositions);

    return routeEntity;
  }

  @override
  Future<AddressEntity> getAddress(String query) async {
    final searchAddressModel = await _azureDataSource.searchAddress(query);

    var firstAddress = searchAddressModel.results.first;

    AddressViewport viewport = AddressViewport(
        topLeftPoint: Position(
            lat: firstAddress.viewport.topLeftPoint.lat,
            lon: firstAddress.viewport.topLeftPoint.lon),
        bottomRightPoint: Position(
            lat: firstAddress.viewport.btmRightPoint.lat,
            lon: firstAddress.viewport.btmRightPoint.lon));

    AddressEntity address = AddressEntity(
        position: Position(
            lat: firstAddress.position.lat, lon: firstAddress.position.lon),
        viewport: viewport);

    return address;
  }
}
