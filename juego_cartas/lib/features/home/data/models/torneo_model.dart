import 'dart:convert';

import 'package:juego_cartas/features/home/domain/entities/torneo_entity.dart';

List<TorneoModel> torneosFromJson(String str) => List<TorneoModel>.from(
  json.decode(str).map((x) => TorneoModel.fromJson(x)),
);

String torneosToJson(List<TorneoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TorneoModel extends Torneo {
  TorneoModel({
    required super.torneoId,
    required super.nombreTorneo,
    required super.fyHInicioT,
    required super.fyHFinT,
    required super.estado,
    required super.idPaisRealizacion,
    required super.jugadorGanador,
    required super.organizador,
    required super.partidasDiarias,
    required super.diasDeDuracion,
    required super.maxJugadores,
  });

  factory TorneoModel.fromJson(Map<String, dynamic> json) => TorneoModel(
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
