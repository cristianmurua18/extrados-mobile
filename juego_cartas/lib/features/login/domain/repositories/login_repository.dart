//Clase abstracta que define todos los metodos que va a tener el repositorio
//Solo la firma de los metodos, que luego se implementan en la capa data

import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/login/domain/entities/respuesta_login_entity.dart';

abstract class LoginRepository {
  //Con el Either tengo dos opcion para que el metodo retorne algo:
  //Un Failure si hay error o la entidad como tal

  //Aqui se llama a la API, por eso el Future

  //A lo mejor solo pueda devolver un bool, true o false? Pero tambien debo devolver el token
  Future<Either<Failure, AutorizacionRespuesta>> getAutorization(
    String nombreUsuario,
    String contrasena,
  );
  //A lo mejor aqui debo pensar en un metodo para poder registrarse al Sistema SignUp
}
