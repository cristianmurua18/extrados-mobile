part of 'torneos_bloc.dart';

abstract class TorneosState {}

final class TorneosInitial extends TorneosState {}

class TorneosCargando extends TorneosState {}

class TorneosCargados extends TorneosState {
  final List<Torneo> torneos;

  TorneosCargados(this.torneos);
}

class TorneosError extends TorneosState {
  final String mensaje;

  TorneosError(this.mensaje);
}
