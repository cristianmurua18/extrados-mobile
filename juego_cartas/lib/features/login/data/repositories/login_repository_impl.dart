//Implementacion de la funcionalidad de los metodos
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/core/network/api_result.dart';
import 'package:juego_cartas/core/network/api_service.dart';
import 'package:juego_cartas/features/login/domain/entities/respuesta_login_entity.dart';
import 'package:juego_cartas/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final ApiService apiService;
  LoginRepositoryImpl({required this.apiService});

  //Aqui creo que lo que deberia devolver es una respuesta login. Welcome

  @override
  Future<Either<Failure, AutorizacionRespuesta>> getAutorization(
    String nombreUsuario,
    String contrasena,
    //El evento le mete estos datos? Capaz antes no hacen falta declarar?
  ) async {
    try {
      //Llamada a la API
      final result = await apiService.request(
        method: HttpMethod.post,
        url: "Acceso/LoginUsuarios/",

        //MI METODO RECIBE UN BODY. COMO SE LO PASO?
        body: {'nombreUsuario': nombreUsuario, 'contraseña': contrasena},
        //Revisar bien como mandar usuario y contraseña, en json
      );

      if (result.resultType == ResultType.failure) {
        return Left(NotFoundFailure('Lo siento, un error ha occurrido.'));
      }

      if (result.resultType == ResultType.success) {
        //No entiendo la diferencia entre esta y el bloc
        final welcome = AutorizacionRespuesta.fromJson(result.body);

        return Right(welcome);
        //devuelvo el derecho
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
