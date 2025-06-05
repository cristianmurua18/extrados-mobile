//Esta es para la respuesta de la api

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:juego_cartas/features/principal/domain/entities/user_entity.dart';

AutorizacionRespuesta welcomeFromJson(String str) =>
    AutorizacionRespuesta.fromJson(json.decode(str));

String welcomeToJson(AutorizacionRespuesta data) => json.encode(data.toJson());

class AutorizacionRespuesta {
  final String token;
  final bool resultado;
  final String msj;
  Usuario usuario;

  AutorizacionRespuesta({
    required this.token,
    required this.resultado,
    required this.msj,
    required this.usuario,
  });

  factory AutorizacionRespuesta.fromJson(Map<String, dynamic> json) =>
      AutorizacionRespuesta(
        token: json["token"],
        resultado: json["resultado"],
        msj: json["msj"],
        usuario: Usuario.fromJson(json["usuario"]),
      );

  Map<String, dynamic> toJson() => {
    "token": token,
    "resultado": resultado,
    // es true o false
    "msj": msj,
    //Usuario autorizado o no
    "usuario": usuario.toJson(),
  };
}
