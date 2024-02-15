import 'package:check_weather/core/infra/api_result_model.dart';
import 'package:check_weather/domain/entity/route_entity.dart';
import 'package:check_weather/domain/entity/weather.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';

abstract class PositionRepository {
  Future<ApiResultModel<RouteEntity>> getRoute(
      GetPositionsRequest request);

  Future<ApiResultModel<List<WeatherEntity>>> getWeatherByRoute(
      GetWeatherByPositionsRequest request);
}
