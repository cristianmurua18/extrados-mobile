//Implementacion de la funcionalidad de los metodos
import 'package:dartz/dartz.dart';
import 'package:juego_cartas/core/error/failure_base.dart';
import 'package:juego_cartas/features/local_storage/domain/repositories/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  final SharedPreferences sharedPreferences;
  LocalStorageRepositoryImpl({required this.sharedPreferences});

  static const _tokenKey = 'jwt_token';

  @override
  Future<Either<Failure, String>> getToken(
    //El evento le mete estos datos? Capaz antes no hacen falta declarar?
  ) async {
    //Llamada a la API
    final token = sharedPreferences.getString(_tokenKey);

    if (token == null) {
      return Left(NotFoundFailure('Lo siento, no se encontro el token.'));
    }

    return Right(token);
    //devuelvo el derecho
  }

  @override
  Future<Either<Failure, void>> clearToken() async {
    try {
      await sharedPreferences.remove(_tokenKey);
      return Right(null);
    } catch (e) {
      return Left(NotFoundFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> hasToken() {
    // TODO: implement hasToken
    throw UnimplementedError();
  }
}
