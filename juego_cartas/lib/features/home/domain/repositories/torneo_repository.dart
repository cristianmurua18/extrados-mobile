import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/home/domain/entities/torneo_entity.dart';

//Se definen todos los metodos que va a tener el repositorio
//Luego se implementan en la capa data

abstract class TorneoRepository {
  //Obtener los torneos de la api
  Future<Either<Failure, List<Torneo>>> getTorneos();
}
