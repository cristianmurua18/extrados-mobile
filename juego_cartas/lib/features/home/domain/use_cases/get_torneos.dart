//Aque se inyecta
import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/home/domain/entities/torneo_entity.dart';
import 'package:juego_cartas/features/home/domain/repositories/torneo_repository.dart';

class GetTorneosUseCase {
  //Luego lo inyecto por inyeccion de dependencia
  final TorneoRepository repository;

  GetTorneosUseCase({required this.repository});

  //Se define el metodo que va a tener el use case
  //El use case es el que se va a encargar de llamar al repositorio abstracto del dominio
  Future<Either<Failure, List<Torneo>>> call() {
    return repository.getTorneos();
  }
}
