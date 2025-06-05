class Usuario {
  int usuarioId;
  String nombreApellido;
  String alias;
  int idPaisOrigen;
  String email;
  String nombreUsuario;
  String contrasea;
  dynamic fotoAvatar;
  String rol;
  dynamic creadoPor;
  bool activo;
  int paisId;
  String nombrePais;

  Usuario({
    required this.usuarioId,
    required this.nombreApellido,
    required this.alias,
    required this.idPaisOrigen,
    required this.email,
    required this.nombreUsuario,
    required this.contrasea,
    required this.fotoAvatar,
    required this.rol,
    required this.creadoPor,
    required this.activo,
    required this.paisId,
    required this.nombrePais,
  });

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
    usuarioId: json["usuarioID"],
    nombreApellido: json["nombreApellido"],
    alias: json["alias"],
    idPaisOrigen: json["idPaisOrigen"],
    email: json["email"],
    nombreUsuario: json["nombreUsuario"],
    contrasea: json["contraseña"],
    fotoAvatar: json["fotoAvatar"],
    rol: json["rol"],
    creadoPor: json["creadoPor"],
    activo: json["activo"],
    paisId: json["paisID"],
    nombrePais: json["nombrePais"],
  );

  Map<String, dynamic> toJson() => {
    "usuarioID": usuarioId,
    "nombreApellido": nombreApellido,
    "alias": alias,
    "idPaisOrigen": idPaisOrigen,
    "email": email,
    "nombreUsuario": nombreUsuario,
    "contraseña": contrasea,
    "fotoAvatar": fotoAvatar,
    "rol": rol,
    "creadoPor": creadoPor,
    "activo": activo,
    "paisID": paisId,
    "nombrePais": nombrePais,
  };
}
