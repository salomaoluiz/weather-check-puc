import 'package:check_weather/domain/repository/position_repository.dart';
import 'package:check_weather/domain/use_case/get_address.dart';
import 'package:check_weather/domain/use_case/get_travel_weathers.dart';
import 'package:check_weather/infra/data/datasource/azure_data_source.dart';
import 'package:check_weather/infra/repository/position_repository_imp.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupGetIt() async {
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton<AzureDataSource>(() => AzureDataSource());
  getIt.registerLazySingleton<PositionRepository>(
      () => PositionRepositoryImpl());
  getIt.registerLazySingleton<GetTravelWeathersUseCase>(
      () => GetTravelWeathersUseCase());
  getIt.registerLazySingleton<GetAddressUseCase>(() => GetAddressUseCase());
}
