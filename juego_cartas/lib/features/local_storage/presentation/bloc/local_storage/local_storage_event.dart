part of 'local_storage_bloc.dart';

abstract class LocalStorageEvent {}

class LoadToken extends LocalStorageEvent {}

class SaveToken extends LocalStorageEvent {
  final String token;
  SaveToken(this.token);
}
