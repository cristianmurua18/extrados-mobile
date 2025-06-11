//Clase abstracta que define todos los metodos que va a tener el repositorio
//Solo la firma de los metodos, que luego se implementan en la capa data

import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';

abstract class LocalStorageRepository {
  
  //Devuelve el token
  Future<Either<Failure, String>> getToken();

  Future<Either<Failure, bool>> hasToken();

  Future<Either<Failure, bool>> saveToken(String token);

  Future<Either<Failure, bool>> clearToken();
}
