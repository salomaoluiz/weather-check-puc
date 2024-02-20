import 'package:check_weather/core/domain/base_use_case.dart';
import 'package:check_weather/core/infra/error_result_model.dart';
import 'package:check_weather/domain/entity/travel_weather_entity.dart';
import 'package:check_weather/domain/repository/position_repository.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTravelWeathersUseCase
    implements
        BaseParamsUseCase<List<TravelWeatherEntity>, GetPositionsRequest> {
  GetTravelWeathersUseCase(this.positionRepository);

  final PositionRepository positionRepository;

  @override
  Future<List<TravelWeatherEntity>> call(GetPositionsRequest params) async {
    try {
      var route = await positionRepository.getRoute(params);

      if (route.position.isNotEmpty) {
        var weather = await positionRepository.getWeatherByRoute(
            GetWeatherByPositionsRequest(positions: route.position));

        List<TravelWeatherEntity> travelWeathers = [];
        weather.asMap().forEach((index, element) {
          travelWeathers.add(TravelWeatherEntity(
              position: route.position[index], weather: element));
        });
        return travelWeathers;
      } else {
        throw const ErrorResultModel(message: "Empty Route", statusCode: 404);
      }
    } on ErrorResultModel catch (_) {
      rethrow;
    } catch (_) {
      throw const ErrorResultModel(message: "Unknown Error", statusCode: 500);
    }
  }
}
