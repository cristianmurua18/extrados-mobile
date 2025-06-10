import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/local_storage/domain/repositories/local_storage_repository.dart';

class ClearTokenUseCase {
  //Este es el caso de uso que se encarga de obtener la autorizacion del usuario
  //Recibe el repositorio que hemos creado para tal fin como parametro para poder usarlo
  final LocalStorageRepository repository;

  //Luego a futuro, con iny dep lo inyecto
  ClearTokenUseCase({required this.repository});

  Future<Either<Failure, bool>> call() {
    return repository.clearToken();
  }
}
