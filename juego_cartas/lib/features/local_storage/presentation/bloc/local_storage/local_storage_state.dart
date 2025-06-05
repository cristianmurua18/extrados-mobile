part of 'local_storage_bloc.dart';

abstract class LocalStorageState {}

class LocalStorageInitial extends LocalStorageState {}

class TokenLoaded extends LocalStorageState {
  final String? token;
  TokenLoaded(this.token);
}
