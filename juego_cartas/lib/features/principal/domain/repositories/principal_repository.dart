//Clase abstracta que define todos los metodos que va a tener el repositorio
//Solo la firma de los metodos, que luego se implementan en la capa data

import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/principal/domain/entities/mazo_entity.dart';
import 'package:juego_cartas/features/principal/domain/entities/user_entity.dart';

abstract class PrincipalRepository {
  //Con el Either tengo dos opcion para que el metodo retorne algo:
  //Un Failure si hay error o la entidad como tal

  Future<Either<Failure, Usuario>> getMisDatos();

  //Metodo para ver los mazos de jugador
  Future<Either<Failure, List<MazoEntity>>> getMazos();

  Future<Either<Failure, bool>> registroATorneo();
}
