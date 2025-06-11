part of 'login_bloc.dart';

abstract class LoginState {}

class HayLogin extends LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});
}

class AuthFailure extends LoginState {
  final String message;

  AuthFailure(this.message);
}

//Para registro del jugador
class RegistroInitial extends LoginState {}

class RegistroSuccess extends LoginState {}

class RegistroFailure extends LoginState {
  final String mensaje;
  RegistroFailure(this.mensaje);
}
