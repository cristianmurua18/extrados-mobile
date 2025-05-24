import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:juego_cartas/features/home/domain/entities/torneo_entity.dart';
import 'package:juego_cartas/features/home/domain/use_cases/get_torneos.dart';

part 'torneos_event.dart';
part 'torneos_state.dart';

class TorneosBloc extends Bloc<TorneosEvent, TorneosState> {
  final GetTorneosUseCase getTorneosUseCase;

  TorneosBloc(this.getTorneosUseCase) : super(TorneosInitial()) {
    on<CargarTorneosEvent>(_onGetTorneosEvent);
  }
  Future<void> _onGetTorneosEvent(
    CargarTorneosEvent event,
    Emitter<TorneosState> emit,
  ) async {
    emit(TorneosCargando());

    final torneos = await getTorneosUseCase.call();
    return torneos.fold(
      (leftError) => emit(TorneosError("Error al obtener torneos.")),
      (rigthLogin) => emit(TorneosCargados(rigthLogin)),
    );
  }
}
