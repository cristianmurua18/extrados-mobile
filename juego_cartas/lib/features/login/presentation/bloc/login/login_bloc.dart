import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juego_cartas/features/login/domain/use_cases/get_autorizacion.dart';

part 'login_event.dart';
part 'login_state.dart';

//Recibe el evento de la UI
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //Aqui se llama a la inicializacion de los casos de uso
  //Ejecuta el caso de uso con los datos del evento
  final GetAutorizacionUseCase getAutorizacionUseCase;

  //Aqui no se de donde viene login
  LoginBloc(this.getAutorizacionUseCase) : super(LoginInitial()) {
    on<LoginRequested>(_onGetAutorizacionEvent);
  }

  Future<void> _onGetAutorizacionEvent(
    LoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(
      LoginLoading(),
    ); //Aqui debo recibir la info del event, usuario y contraseña
    final autorizacion = await getAutorizacionUseCase.call(
      event.nombreUsuario,
      event.contrasena,
    );
    return autorizacion.fold(
      (leftError) => emit(AuthFailure('Credenciales incorrectas')),
      (rigthLogin) =>
          emit(LoginSuccess(token: rigthLogin.token)), //Como paso el token?
      //El token lo manejo desde data, revisar
    );
  }
}
