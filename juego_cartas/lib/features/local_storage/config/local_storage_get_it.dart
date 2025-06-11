import 'package:get_it/get_it.dart';
import 'package:juego_cartas/features/local_storage/data/repositories/local_storage_repository_impl.dart';
import 'package:juego_cartas/features/local_storage/domain/repositories/local_storage_repository.dart';
import 'package:juego_cartas/features/local_storage/domain/use_cases/clear_token.dart';
import 'package:juego_cartas/features/local_storage/domain/use_cases/get_token.dart';
import 'package:juego_cartas/features/local_storage/domain/use_cases/has_token.dart';
import 'package:juego_cartas/features/local_storage/domain/use_cases/save_token.dart';
import 'package:shared_preferences/shared_preferences.dart';

void localStorageConfigure() async {
  //SERIA ASINCRONO? NO
  final sharedPreferences = await SharedPreferences.getInstance();

  GetIt.instance.registerSingleton<SharedPreferences>(sharedPreferences);
  //Repository y su implementacion
  GetIt.instance.registerLazySingleton<LocalStorageRepository>(
    () => LocalStorageRepositoryImpl(sharedPreferences: GetIt.instance.get()),
  );

  //Use cases
  GetIt.instance.registerSingleton(
    GetTokenUseCase(repository: GetIt.instance.get()),
  );

  GetIt.instance.registerSingleton(
    ClearTokenUseCase(repository: GetIt.instance.get()),
  );

  GetIt.instance.registerSingleton(
    SaveTokenUseCase(repository: GetIt.instance.get()),
  );

  GetIt.instance.registerSingleton(
    HasTokenUseCase(repository: GetIt.instance.get()),
  );

  //DataSources si tuviera
}
