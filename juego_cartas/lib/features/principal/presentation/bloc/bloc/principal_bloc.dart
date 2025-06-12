import 'package:flutter_bloc/flutter_bloc.dart';

part 'principal_event.dart';
part 'principal_state.dart';

class PrincipalBloc extends Bloc<PrincipalEvent, PrincipalState> {
  PrincipalBloc() : super(PrincipalInitial()) {
    on<PrincipalEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
