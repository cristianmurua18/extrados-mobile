//Esto debo pasar en el body para la request a la api

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginEntity welcomeFromJson(String str) =>
    LoginEntity.fromJson(json.decode(str));
//En base a un Json que recibo, creame una clase

String welcomeToJson(LoginEntity data) => json.encode(data.toJson());

class LoginEntity {
  String nombreUsuario;
  String contrasena;

  LoginEntity({required this.nombreUsuario, required this.contrasena});
  //Asi es como viene mi info de la api, y la hago una clase
  factory LoginEntity.fromJson(Map<String, dynamic> json) => LoginEntity(
    nombreUsuario: json["nombreUsuario"],
    contrasena: json["contraseña"],
  );

  //Esto es para guardar info en la base de datos. Lo hago un json
  Map<String, dynamic> toJson() => {
    "nombreUsuario": nombreUsuario,
    "contraseña": contrasena,
  };
}
