//Esta es para la respuesta de la api

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  final String token;
  final bool resultado;
  final String msj;

  Welcome({required this.token, required this.resultado, required this.msj});

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    token: json["token"],
    resultado: json["resultado"],
    msj: json["msj"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
    "resultado": resultado,
    // es true o false
    "msj": msj,
    //Usuario autorizado o no
  };
}
