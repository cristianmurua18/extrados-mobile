import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/login/domain/repositories/login_repository.dart';
import 'package:juego_cartas/features/principal/domain/entities/insert_user.dart';

class SignUpUseCase {
  //Este es el caso de uso que se encarga de obtener la autorizacion del usuario
  //Recibe el repositorio que hemos creado para tal fin como parametro para poder usarlo
  final LoginRepository repository;

  //Luego a futuro, con iny dep lo inyecto
  SignUpUseCase({required this.repository});

  Future<Either<Failure, bool>> call(UserDTO usuario) {
    return repository.signUp(usuario);
  }
}
