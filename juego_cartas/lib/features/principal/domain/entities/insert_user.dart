// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserDTO welcomeFromJson(String str) => UserDTO.fromJson(json.decode(str));

String welcomeToJson(UserDTO data) => json.encode(data.toJson());

class UserDTO {
  String nombreApellido;
  String alias;
  int idPaisOrigen;
  String email;
  String nombreUsuario;
  String contrasena;
  String rol;
  bool activo;

  UserDTO({
    required this.nombreApellido,
    required this.alias,
    required this.idPaisOrigen,
    required this.email,
    required this.nombreUsuario,
    required this.contrasena,
    required this.rol,
    required this.activo,
  });

  factory UserDTO.fromJson(Map<String, dynamic> json) => UserDTO(
    nombreApellido: json["nombreApellido"],
    alias: json["alias"],
    idPaisOrigen: json["idPaisOrigen"],
    email: json["email"],
    nombreUsuario: json["nombreUsuario"],
    contrasena: json["contraseña"],
    rol: json["rol"],
    activo: json["activo"],
  );

  Map<String, dynamic> toJson() => {
    "nombreApellido": nombreApellido,
    "alias": alias,
    "idPaisOrigen": idPaisOrigen,
    "email": email,
    "nombreUsuario": nombreUsuario,
    "contraseña": contrasena,
    "rol": rol,
    "activo": activo,
  };
}
