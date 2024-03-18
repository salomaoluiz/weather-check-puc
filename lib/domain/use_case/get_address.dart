import 'package:check_weather/core/domain/base_use_case.dart';
import 'package:check_weather/di/service.dart';
import 'package:check_weather/domain/entity/address.dart';
import 'package:check_weather/domain/repository/position_repository.dart';

class AddressMap {
  late AddressEntity initialCity;
  late AddressEntity finalCity;

  AddressMap({required this.initialCity, required this.finalCity});
}

class GetAddressUseCaseParams {
  late String initialCity;
  late String finalCity;

  GetAddressUseCaseParams({required this.initialCity, required this.finalCity});
}

class GetAddressUseCase
    implements BaseParamsUseCase<AddressMap, GetAddressUseCaseParams> {
  final PositionRepository positionRepository = getIt<PositionRepository>();

  @override
  Future<AddressMap> call(GetAddressUseCaseParams params) async {
    var initialCity = await positionRepository.getAddress(params.initialCity);
    var finalCity = await positionRepository.getAddress(params.finalCity);

    return AddressMap(initialCity: initialCity, finalCity: finalCity);
  }
}
