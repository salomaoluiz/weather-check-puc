
abstract class BaseParamsUseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class NoParamsUseCase<Type> {
  Future<Type> call();
}
