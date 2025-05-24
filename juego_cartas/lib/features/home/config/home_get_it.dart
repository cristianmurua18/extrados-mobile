import 'package:get_it/get_it.dart';
import 'package:juego_cartas/core/network/api_service.dart';
import 'package:juego_cartas/core/network/dio_client.dart';
import 'package:juego_cartas/features/home/data/repositories/torneo_repository_impl.dart';
import 'package:juego_cartas/features/home/domain/repositories/torneo_repository.dart';
import 'package:juego_cartas/features/home/domain/use_cases/get_torneos.dart';

void homeConfigure() {
  //SERIA ASINCRONO?

  //Faltaria el Bloc? NO. Se inyecta en el main

  //Api service
  GetIt.instance.registerLazySingleton<ApiService>(() => ApiService(dioClient));

  //Repository y su implementacion
  GetIt.instance.registerLazySingleton<TorneoRepository>(
    () => TorneoRepositoryImpl(apiService: GetIt.instance.get()),
  );

  //Use cases
  GetIt.instance.registerSingleton(
    GetTorneosUseCase(repository: GetIt.instance.get()),
  );

  //DataSources si tuviera
}
