import 'package:check_weather/domain/entity/address.dart';
import 'package:check_weather/domain/entity/route_entity.dart';
import 'package:check_weather/domain/entity/weather.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';

abstract class PositionRepository {
  Future<RouteEntity> getRoute(GetPositionsRequest request);

  Future<List<WeatherEntity>> getWeatherByRoute(
      GetWeatherByPositionsRequest request);

  Future<AddressEntity> getAddress(String query);
}
