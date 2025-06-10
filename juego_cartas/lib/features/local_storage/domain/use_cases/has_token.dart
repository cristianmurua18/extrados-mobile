import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/local_storage/domain/repositories/local_storage_repository.dart';

//Cuando el usuario interactue con la app, a traves de botones por ej llamo a los casos de uso

class HasTokenUseCase {
  //Este es el caso de uso que se encarga de obtener la autorizacion del usuario
  //Recibe el repositorio que hemos creado para tal fin como parametro para poder usarlo
  final LocalStorageRepository repository;

  //Luego a futuro, con iny dep lo inyecto
  HasTokenUseCase({required this.repository});

  Future<Either<Failure, bool>> call() {
    return repository.hasToken();
  }
}
