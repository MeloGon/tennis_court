import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court/core/di/service_locator.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/reserve/domain/entities/reservation.dart';
import 'package:tennis_court/features/reserve/domain/usecases/add_reservation_usecase.dart';
import 'package:tennis_court/features/reserve/domain/usecases/delete_reservation_usecase.dart';
import 'package:tennis_court/features/reserve/domain/usecases/get_reservations_usecase.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitialState()) {
    on<LoadReservationsEvent>(_onLoadReservations);
    on<AddReservationEvent>(_onAddReservation);
    on<DeleteReservationEvent>(_onDeleteReservation);
  }

  void loadReservations() {
    add(LoadReservationsEvent());
  }

  void addReservation(Reservation reservation) {
    add(AddReservationEvent(reservation));
  }

  void deleteReservation(String id) {
    add(DeleteReservationEvent(id));
  }

  Future<void> _onLoadReservations(
    LoadReservationsEvent event,
    Emitter<ReservationState> emit,
  ) async {
    emit(ReservationLoadingState());
    try {
      final reservations =
          await getIt<GetReservationsUsecase>().call(NoParams());
      reservations.fold(
          (failure) => emit(ReservationErrorState(failure.message)),
          (reservations) => emit(ReservationLoadedState(reservations)));
    } catch (e) {
      emit(ReservationErrorState('Failed to load reservations'));
    }
  }

  Future<void> _onAddReservation(
    AddReservationEvent event,
    Emitter<ReservationState> emit,
  ) async {
    try {
      await getIt<AddReservationUsecase>().call(event.reservation);
      add(LoadReservationsEvent());
    } catch (e) {
      emit(ReservationErrorState('Failed to add reservation'));
    }
  }

  Future<void> _onDeleteReservation(
    DeleteReservationEvent event,
    Emitter<ReservationState> emit,
  ) async {
    try {
      await getIt<DeleteReservationUsecase>().call(event.id);
      add(LoadReservationsEvent());
    } catch (e) {
      emit(ReservationErrorState('Failed to delete reservation'));
    }
  }
}
