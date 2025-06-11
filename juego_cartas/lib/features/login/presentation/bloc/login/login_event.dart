part of 'login_bloc.dart';

abstract class LoginEvent {}
//Los eventos se relacionan con los casos de uso

//Para ver si hay login
class LoginExist extends LoginEvent {}

class RegistrarJugadorEvent extends LoginEvent {
  final String nombreApellido;
  final String alias;
  final int idPaisOrigen;
  final String email;
  final String nombreUsuario;
  final String contrasena;
  final String rol;
  final bool activo;

  RegistrarJugadorEvent({
    required this.nombreApellido,
    required this.alias,
    required this.idPaisOrigen,
    required this.email,
    required this.nombreUsuario,
    required this.contrasena,
    required this.rol,
    required this.activo,
  });
}

//Es una instancia de LoginEvent
class LoginRequested extends LoginEvent {
  final String nombreUsuario;
  final String contrasena;

  LoginRequested(this.nombreUsuario, this.contrasena);
}
