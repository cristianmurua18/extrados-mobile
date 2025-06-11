import 'package:get_it/get_it.dart';
import 'package:juego_cartas/features/login/data/repositories/login_repository_impl.dart';
import 'package:juego_cartas/features/login/domain/repositories/login_repository.dart';
import 'package:juego_cartas/features/login/domain/use_cases/get_autorizacion.dart';
import 'package:juego_cartas/features/login/domain/use_cases/sign_up.dart';

void loginConfigure() {
  //SERIA ASINCRONO? NO

  //Faltaria el Bloc? NO. Se inyecta en el main

  //Api service
  //GetIt.instance.registerLazySingleton<ApiService>(() => ApiService(dioClient));

  //Repository y su implementacion
  GetIt.instance.registerLazySingleton<LoginRepository>(
    () => LoginRepositoryImpl(apiService: GetIt.instance.get()),
  );

  //Use cases
  GetIt.instance.registerSingleton(
    GetAutorizacionUseCase(repository: GetIt.instance.get()),
  );

  GetIt.instance.registerSingleton(
    SignUpUseCase(repository: GetIt.instance.get()),
  );

  //DataSources si tuviera
}
