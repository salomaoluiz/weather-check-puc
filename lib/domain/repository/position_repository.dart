import 'package:check_weather/core/infra/api_result_model.dart';
import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';

abstract class PositionRepository {
  Future<ApiResultModel<List<PositionEntity>>> getPositions(GetPositionsRequest request);
}