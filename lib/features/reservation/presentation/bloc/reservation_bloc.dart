import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tennis_court/core/di/service_locator.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/reservation/domain/entities/reservation.dart';
import 'package:tennis_court/features/reservation/domain/usecases/add_reservation_usecase.dart';
import 'package:tennis_court/features/reservation/domain/usecases/delete_reservation_usecase.dart';
import 'package:tennis_court/features/reservation/domain/usecases/get_reservations_usecase.dart';

part 'reservation_event.dart';
part 'reservation_state.dart';

class ReservationBloc extends Bloc<ReservationEvent, ReservationState> {
  ReservationBloc() : super(ReservationInitialState()) {
    on<LoadReservationsEvent>(_onLoadReservations);
    on<AddReservationEvent>(_onAddReservation);
    on<DeleteReservationEvent>(_onDeleteReservation);
    //
    on<UpdateReservationDateEvent>(_onUpdateDate);
    on<UpdateReservationStartTimeEvent>(_onUpdateStartTime);
    on<UpdateReservationEndTimeEvent>(_onUpdateEndTime);
    on<UpdateReservationInstructorEvent>(_onUpdateInstructor);
    on<UpdateReservationCommentEvent>(_onUpdateComment);
    on<SubmitReservationEvent>(_onSubmitReservation);
    on<ChargeCourtDataEvent>(_onChargeCourtData);
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

  void _onUpdateDate(
      UpdateReservationDateEvent event, Emitter<ReservationState> emit) {
    if (state is ReservationFormState) {
      emit((state as ReservationFormState).copyWith(date: event.date));
    } else {
      emit(ReservationFormState(date: event.date));
    }
  }

  void _onUpdateStartTime(
      UpdateReservationStartTimeEvent event, Emitter<ReservationState> emit) {
    if (state is ReservationFormState) {
      emit(
          (state as ReservationFormState).copyWith(startTime: event.startTime));
    } else {
      emit(ReservationFormState(startTime: event.startTime));
    }
  }

  void _onUpdateEndTime(
      UpdateReservationEndTimeEvent event, Emitter<ReservationState> emit) {
    if (state is ReservationFormState) {
      emit((state as ReservationFormState).copyWith(endTime: event.endTime));
    } else {
      emit(ReservationFormState(endTime: event.endTime));
    }
  }

  void _onUpdateInstructor(
      UpdateReservationInstructorEvent event, Emitter<ReservationState> emit) {
    if (state is ReservationFormState) {
      emit((state as ReservationFormState)
          .copyWith(instructor: event.instructor));
    } else {
      emit(ReservationFormState(instructor: event.instructor));
    }
  }

  void _onUpdateComment(
      UpdateReservationCommentEvent event, Emitter<ReservationState> emit) {
    if (state is ReservationFormState) {
      emit((state as ReservationFormState).copyWith(comment: event.comment));
    } else {
      emit(ReservationFormState(comment: event.comment));
    }
  }

  void _onChargeCourtData(
      ChargeCourtDataEvent event, Emitter<ReservationState> emit) {
    if (state is ReservationFormState) {
      emit((state as ReservationFormState).copyWith(court: event.court));
    } else {
      emit(ReservationFormState(court: event.court));
    }
  }

  void _onSubmitReservation(
      SubmitReservationEvent event, Emitter<ReservationState> emit) {
    if (state is ReservationFormState) {
      final formState = state as ReservationFormState;
      final reservation = Reservation(
        reservationDate: formState.date!,
        initTime: formState.startTime!,
        endTime: formState.endTime!,
        instructor: formState.instructor!,
        comment: formState.comment!,
        courtName: formState.court!.name!,
        price: formState.court!.price!,
        photo: formState.court!.imageUrl,
      );
      addReservation(reservation);
    } else {
      emit(ReservationErrorState('Please complete all the fields'));
    }
  }
}
