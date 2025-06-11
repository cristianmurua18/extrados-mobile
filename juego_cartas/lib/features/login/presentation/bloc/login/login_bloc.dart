import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juego_cartas/features/login/domain/use_cases/get_autorizacion.dart';
import 'package:juego_cartas/features/login/domain/use_cases/sign_up.dart';
import 'package:juego_cartas/features/principal/domain/entities/insert_user.dart';

part 'login_event.dart';
part 'login_state.dart';

//Recibe el evento de la UI
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //Aqui se llama a la inicializacion de los casos de uso
  //Ejecuta el caso de uso con los datos del evento
  final GetAutorizacionUseCase getAutorizacionUseCase;

  final SignUpUseCase signUpUseCase;

  //Aqui no se de donde viene login
  LoginBloc(this.getAutorizacionUseCase, this.signUpUseCase)
    : super(LoginInitial()) {
    on<LoginRequested>(_onGetAutorizacionEvent);
    on<RegistrarJugadorEvent>(_onRegistroJugadorSubmitted);
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

  Future<void> _onRegistroJugadorSubmitted(
    RegistrarJugadorEvent event,
    Emitter<LoginState> emit,
  ) async {
    emit(RegistroInitial());

    try {
      final userDTO = UserDTO(
        nombreApellido: event.nombreApellido,
        alias: event.alias,
        idPaisOrigen: event.idPaisOrigen,
        email: event.email,
        nombreUsuario: event.nombreUsuario,
        contrasena: event.contrasena,
        rol: event.rol,
        activo: event.activo,
      );
      await signUpUseCase.call(userDTO);
      emit(RegistroSuccess());
    } catch (e) {
      emit(RegistroFailure(e.toString()));
    }
  }
}
