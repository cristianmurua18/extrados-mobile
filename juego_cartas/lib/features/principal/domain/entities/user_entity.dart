class Usuario {
  final String usuarioid;
  final String nombreapellido;
  final String alias;
  final int idpaisorigen;
  final String email;
  final String nombreusuario;
  final String contrasena;
  final String fotoavatar;
  final String rol;
  final int creadopor;
  final bool activo;

  Usuario({
    required this.usuarioid,
    required this.nombreapellido,
    required this.alias,
    required this.idpaisorigen,
    required this.email,
    required this.nombreusuario,
    required this.contrasena,
    required this.fotoavatar,
    required this.rol,
    required this.creadopor,
    required this.activo,
  });
}
