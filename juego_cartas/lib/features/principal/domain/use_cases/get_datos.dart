import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/principal/domain/entities/user_entity.dart';
import 'package:juego_cartas/features/principal/domain/repositories/principal_repository.dart';

class GetDatosUseCase {
  //Este es el caso de uso que se encarga de obtener la autorizacion del usuario
  //Recibe el repositorio que hemos creado para tal fin como parametro para poder usarlo
  final PrincipalRepository repository;

  //Luego a futuro, con iny dep lo inyecto
  GetDatosUseCase({required this.repository});

  Future<Either<Failure, Usuario>> call() {
    return repository.getMisDatos();
  }
}
