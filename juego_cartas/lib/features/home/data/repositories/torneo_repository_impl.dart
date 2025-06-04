import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/core/network/api_result.dart';
import 'package:juego_cartas/core/network/api_service.dart';
import 'package:juego_cartas/features/home/data/models/torneo_model.dart';
import 'package:juego_cartas/features/home/domain/entities/torneo_entity.dart';
import 'package:juego_cartas/features/home/domain/repositories/torneo_repository.dart';

class TorneoRepositoryImpl implements TorneoRepository {
  final ApiService apiService;

  TorneoRepositoryImpl({required this.apiService});

  @override
  Future<Either<Failure, List<Torneo>>> getTorneos() async {
    try {
      final result = await apiService.request(
        method: HttpMethod.get,
        url: "Acceso/VerInfoTorneos/",
      );

      if (result.resultType == ResultType.failure) {
        return Left(NotFoundFailure('Lo siento, un error ha occurrido.'));
      }

      if (result.resultType == ResultType.success) {
        final data = result.body as List;
        final torneos = data.map((json) => TorneoModel.fromJson(json)).toList();
        //No entiendo la diferencia entre esta y el bloc
        //final torneos = Torneo.fromJson(result.body);
        //Hacer un from map

        return Right(torneos);
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
