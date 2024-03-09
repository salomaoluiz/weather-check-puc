import 'package:check_weather/domain/entity/route_entity.dart';
import 'package:check_weather/domain/entity/weather.dart';
import 'package:check_weather/domain/entity/weather_theme.dart';
import 'package:check_weather/domain/repository/position_repository.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/infra/data/datasource/azure_data_source.dart';

class PositionRepositoryImpl implements PositionRepository {
  final AzureDataSource _azureDataSource;

  PositionRepositoryImpl(this._azureDataSource);

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
  Future<RouteEntity> getRoute(GetPositionsRequest request) {
    // TODO: implement getRoute
    throw UnimplementedError();
  }
}
