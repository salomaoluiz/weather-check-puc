import 'package:check_weather/core/infra/api_result_model.dart';

abstract class BaseParamsUseCase<Type, Params> {
  Future<ApiResultModel<Type>> call(Params params);
}

abstract class NoParamsUseCase<Type> {
  Future<ApiResultModel<Type>> call();
}
