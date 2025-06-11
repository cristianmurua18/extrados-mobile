//Implementacion de la funcionalidad de los metodos
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/core/network/api_result.dart';
import 'package:juego_cartas/core/network/api_service.dart';
import 'package:juego_cartas/features/principal/domain/entities/mazo_entity.dart';
import 'package:juego_cartas/features/principal/domain/entities/user_entity.dart';
import 'package:juego_cartas/features/principal/domain/repositories/principal_repository.dart';

class PrincipalRepositoryImpl implements PrincipalRepository {
  final ApiService apiService;
  PrincipalRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<MazoEntity>>> getMazos() async {
    try {
      //Llamada a la API
      final result = await apiService.request(
        method: HttpMethod.get,
        url: "Jugador/VerMisMazos/",
      );

      if (result.resultType == ResultType.failure) {
        return Left(NotFoundFailure('Lo siento, un error ha occurrido.'));
      }

      if (result.resultType == ResultType.success) {
        final data = result.body as List;
        final mazos = data.map((json) => MazoEntity.fromJson(json)).toList();
        return Right(mazos);
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
  Future<Either<Failure, Usuario>> getMisDatos() {
    // TODO: implement getMisDatos
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> registroATorneo() {
    // TODO: implement registroATorneo
    throw UnimplementedError();
  }
}
