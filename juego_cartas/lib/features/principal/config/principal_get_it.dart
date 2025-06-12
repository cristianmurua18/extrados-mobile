import 'package:get_it/get_it.dart';
import 'package:juego_cartas/features/principal/data/repositories/principal_repository_impl.dart';
import 'package:juego_cartas/features/principal/domain/repositories/principal_repository.dart';
import 'package:juego_cartas/features/principal/domain/use_cases/get_datos.dart';
import 'package:juego_cartas/features/principal/domain/use_cases/get_mazos.dart';
import 'package:juego_cartas/features/principal/domain/use_cases/registro_torneo.dart';

void principalConfigure() {
  //SERIA ASINCRONO? NO

  //Faltaria el Bloc? NO. Se inyecta en el main

  //Api service
  //GetIt.instance.registerLazySingleton<ApiService>(() => ApiService(dioClient));

  //Repository y su implementacion
  GetIt.instance.registerLazySingleton<PrincipalRepository>(
    () => PrincipalRepositoryImpl(apiService: GetIt.instance.get()),
  );

  //Use cases
  GetIt.instance.registerSingleton(
    GetDatosUseCase(repository: GetIt.instance.get()),
  );

  GetIt.instance.registerSingleton(
    GetMazosUseCase(repository: GetIt.instance.get()),
  );

  GetIt.instance.registerSingleton(
    InscripcionTorneoUseCase(repository: GetIt.instance.get()),
  );
  //DataSources si tuviera
}
