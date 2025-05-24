part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {
  //Aqui a lo mejor debo enviar o tener el valor de las variables?
}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  LoginSuccess({required this.token});
}

class AuthFailure extends LoginState {
  final String message;

  AuthFailure(this.message);
}
