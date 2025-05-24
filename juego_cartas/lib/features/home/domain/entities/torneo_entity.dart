// To parse this JSON data, do
//
//     final torneos = torneosFromJson(jsonString);

import 'dart:convert';

List<Torneo> torneosFromJson(String str) =>
    List<Torneo>.from(json.decode(str).map((x) => Torneo.fromJson(x)));

String torneosToJson(List<Torneo> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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

  factory Torneo.fromJson(Map<String, dynamic> json) => Torneo(
    torneoId: json["torneoID"],
    nombreTorneo: json["nombreTorneo"],
    fyHInicioT: DateTime.parse(json["fyHInicioT"]),
    fyHFinT: DateTime.parse(json["fyHFinT"]),
    estado: json["estado"],
    idPaisRealizacion: json["idPaisRealizacion"],
    jugadorGanador: json["jugadorGanador"],
    organizador: json["organizador"],
    partidasDiarias: json["partidasDiarias"],
    diasDeDuracion: json["diasDeDuracion"],
    maxJugadores: json["maxJugadores"],
  );

  Map<String, dynamic> toJson() => {
    "torneoID": torneoId,
    "nombreTorneo": nombreTorneo,
    "fyHInicioT": fyHInicioT.toIso8601String(),
    "fyHFinT": fyHFinT.toIso8601String(),
    "estado": estado,
    "idPaisRealizacion": idPaisRealizacion,
    "jugadorGanador": jugadorGanador,
    "organizador": organizador,
    "partidasDiarias": partidasDiarias,
    "diasDeDuracion": diasDeDuracion,
    "maxJugadores": maxJugadores,
  };
}
