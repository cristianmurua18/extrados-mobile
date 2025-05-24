part of 'login_bloc.dart';

abstract class LoginEvent {}

//Los eventos se relacionan con los casos de uso

//Es una instancia de LoginEvent
class LoginRequested extends LoginEvent {
  final String nombreUsuario;
  final String contrasena;

  LoginRequested(this.nombreUsuario, this.contrasena);
}
