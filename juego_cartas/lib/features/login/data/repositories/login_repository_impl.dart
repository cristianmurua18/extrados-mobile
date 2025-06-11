//Implementacion de la funcionalidad de los metodos
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/core/network/api_result.dart';
import 'package:juego_cartas/core/network/api_service.dart';
import 'package:juego_cartas/features/login/domain/entities/respuesta_login_entity.dart';
import 'package:juego_cartas/features/login/domain/repositories/login_repository.dart';
import 'package:juego_cartas/features/principal/domain/entities/insert_user.dart';
import 'package:juego_cartas/features/principal/domain/entities/user_entity.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiService apiService;
  LoginRepositoryImpl({required this.apiService});

  @override
  Usuario? usuario;

  //Aqui creo que lo que deberia devolver es una respuesta login. Welcome

  @override
  Future<Either<Failure, AutorizacionRespuesta>> getAutorization(
    String nombreUsuario,
    String contrasena,
    //El evento le mete estos datos
  ) async {
    try {
      //Llamada a la API
      final result = await apiService.request(
        method: HttpMethod.post,
        url: "Acceso/LoginUsuarios/",

        //MI METODO RECIBE UN BODY
        body: {'nombreUsuario': nombreUsuario, 'contraseña': contrasena},
      );

      if (result.resultType == ResultType.failure) {
        return Left(NotFoundFailure('Lo siento, un error ha occurrido.'));
      }

      if (result.resultType == ResultType.success) {
        final welcome = AutorizacionRespuesta.fromJson(result.body);
        usuario = welcome.usuario;
        //devuelvo el derecho
        return Right(welcome);

        //aqui deberia guardar el token y el usuario
      }

      return Left(NotFoundFailure('Respuesta inesperada. Error'));

      //Aqui devuelvo a o b - El izquierdo
    } on DioException catch (e) {
      return Left(NotFoundFailure(e.message!));
    } catch (e) {
      return Left(NotFoundFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> getSesion() {
    // TODO: implement getSesion
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> signUp(UserDTO usuario) async {
    try {
      //Llamada a la API
      final result = await apiService.request(
        method: HttpMethod.post,
        url: "Acceso/RegistroJugador/",
        //MI METODO RECIBE UN BODY
        body: {usuario},
      );

      if (result.resultType == ResultType.failure) {
        return Left(NotFoundFailure('Lo siento, un error ha occurrido.'));
      }

      if (result.resultType == ResultType.success) {
        final resp = result.body;
        //devuelvo el derecho
        return Right(resp);
      }

      return Left(NotFoundFailure('Respuesta inesperada. Error'));

      //Aqui devuelvo a o b - El izquierdo
    } on DioException catch (e) {
      return Left(NotFoundFailure(e.message!));
    } catch (e) {
      return Left(NotFoundFailure(e.toString()));
    }
  }
}
