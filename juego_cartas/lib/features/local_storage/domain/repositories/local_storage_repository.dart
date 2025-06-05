//Clase abstracta que define todos los metodos que va a tener el repositorio
//Solo la firma de los metodos, que luego se implementan en la capa data

import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';

abstract class LocalStorageRepository {
  //Con el Either tengo dos opcion para que el metodo retorne algo:
  //Un Failure si hay error o la entidad como tal

  //Aqui se llama a la API, por eso el Future
  Future<Either<Failure, String>> getToken();

  Future<Either<Failure, String>> hasToken();

  Future<Either<Failure, void>> clearToken();

  
}
