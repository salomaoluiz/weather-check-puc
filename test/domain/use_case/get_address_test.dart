import 'package:check_weather/domain/entity/address.dart';
import 'package:check_weather/domain/repository/position_repository.dart';
import 'package:check_weather/domain/repository/request/position_repository_request.dart';
import 'package:check_weather/domain/use_case/get_address.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class PositionRepositoryMock extends Mock implements PositionRepository {}

void main() {
  setUpAll(() {
    registerFallbackValue(PositionRepositoryMock());
    GetIt.instance.registerLazySingleton<PositionRepository>(
        () => PositionRepositoryMock());
  });

  test("Should request both address", () async {
    final positionRepository = GetIt.instance<PositionRepository>();
    when(() => positionRepository.getAddress(any())).thenAnswer((_) async {
      return AddressEntity(
          position: const Position(lon: 111, lat: -111),
          viewport: AddressViewport(
              bottomRightPoint: const Position(lat: 222, lon: -222),
              topLeftPoint: const Position(lon: 333, lat: -333)));
    });

    final usecase = GetAddressUseCase();

    GetAddressUseCaseParams params = GetAddressUseCaseParams(
        initialCity: "Maringa,Paraná,Brasil",
        finalCity: "Curitiba,Paraná,Brasil");
    final result = await usecase.call(params);

    expect(result.initialCity, isA<AddressEntity>());
    expect(result.finalCity, isA<AddressEntity>());
  });
}
