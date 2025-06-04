class Torneo {
  int torneoId;
  String nombreTorneo;
  DateTime fyHInicioT;
  DateTime fyHFinT;
  String estado;
  int idPaisRealizacion;
  int jugadorGanador;
  int organizador;
  int partidasDiarias;
  int diasDeDuracion;
  int maxJugadores;

  Torneo({
    required this.torneoId,
    required this.nombreTorneo,
    required this.fyHInicioT,
    required this.fyHFinT,
    required this.estado,
    required this.idPaisRealizacion,
    required this.jugadorGanador,
    required this.organizador,
    required this.partidasDiarias,
    required this.diasDeDuracion,
    required this.maxJugadores,
  });
}
