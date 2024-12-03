import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court/core/di/service_locator.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:tennis_court/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/home/domain/usecases/get_courts_usecases.dart';

part 'court_event.dart';
part 'court_state.dart';

class CourtBloc extends Bloc<CourtEvent, CourtState> {
  CourtBloc() : super(CourtInitialState()) {
    on<LoadCourtsEvent>(_onLoadCourts);
    on<ToggleFavoriteEvent>(_onToggleFavorite);
  }

  void loadCourts() {
    add(LoadCourtsEvent());
  }

  void toggleFavorite(String? courtId) {
    add(ToggleFavoriteEvent(courtId!));
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

  void _onToggleFavorite(
      ToggleFavoriteEvent event, Emitter<CourtState> emit) async {
    // if (state is CourtLoadedState) {
    //   final currentState = state as CourtLoadedState;
    //   final courts = currentState.courts.map((court) {
    //     if (court.id == event.courtId) {
    //       final updatedCourt =
    //           court.copyWith(isFavorite: !(court.isFavorite ?? false));
    //       if (updatedCourt.isFavorite ?? false) {
    //         addFavoriteUseCase(court.id);
    //       } else {
    //         removeFavoriteUseCase(court.id);
    //       }
    //       return updatedCourt;
    //     }
    //     return court;
    //   }).toList();

    //   emit(CourtLoadedState(courts));
    // }
    if (state is CourtLoadedState) {
      final currentState = state as CourtLoadedState;
      final court =
          currentState.courts.firstWhere((c) => c.id == event.courtId);
      final updatedCourt =
          court.copyWith(isFavorite: !(court.isFavorite ?? false));

      final result = updatedCourt.isFavorite ?? false
          ? await getIt<AddFavoriteUsecase>().call(updatedCourt.id!)
          : await getIt<RemoveFavoriteUsecase>().call(updatedCourt.id!);

      result.fold(
        (failure) {
          emit(CourtErrorState(failure.message));
        },
        (_) {
          final updatedCourts = currentState.courts.map((c) {
            return c.id == updatedCourt.id ? updatedCourt : c;
          }).toList();

          emit(CourtLoadedState(updatedCourts));
        },
      );
    }
  }
}
