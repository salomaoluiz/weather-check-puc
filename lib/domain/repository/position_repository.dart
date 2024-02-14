import 'package:check_weather/domain/entity/position_entity.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/infra/core/api_result_model.dart';

abstract class PositionRepository {
  Future<ApiResultModel<List<PositionEntity>>> getPositions(GetPositionsRequest request);
}