import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court/core/di/service_locator.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/home/domain/usecases/get_courts_usecases.dart';

part 'court_event.dart';
part 'court_state.dart';

class CourtBloc extends Bloc<CourtEvent, CourtState> {
  CourtBloc() : super(CourtInitialState()) {
    on<LoadCourtsEvent>(_onLoadCourts);
  }

  void loadCourts() {
    add(LoadCourtsEvent());
  }

  Future<void> _onLoadCourts(
      LoadCourtsEvent event, Emitter<CourtState> emit) async {
    try {
      final courts = await getIt<GetCourtsUsecase>().call(NoParams());
      courts.fold((failure) => emit(CourtErrorState(failure.message)),
          (courts) => emit(CourtLoadedState(courts)));
    } catch (e) {
      emit(CourtErrorState('Failed to load courts'));
    }
  }
}
