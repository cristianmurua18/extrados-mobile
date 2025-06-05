import 'package:get_it/get_it.dart';
import 'package:juego_cartas/features/local_storage/data/repositories/local_storage_repository_impl.dart';
import 'package:juego_cartas/features/local_storage/domain/repositories/local_storage_repository.dart';
import 'package:juego_cartas/features/login/domain/use_cases/get_autorizacion.dart';

void localStorageConfigure() {
  //SERIA ASINCRONO? NO

  //Faltaria el Bloc? NO. Se inyecta en el main

  //Api service
  //GetIt.instance.registerLazySingleton<ApiService>(() => ApiService(dioClient));

  //Repository y su implementacion
  GetIt.instance.registerLazySingleton<LocalStorageRepository>(
    () => LocalStorageRepositoryImpl(sharedPreferences: GetIt.instance.get()),
  );

  //Use cases
  GetIt.instance.registerSingleton(
    GetAutorizacionUseCase(repository: GetIt.instance.get()),
  );

  //DataSources si tuviera
}
