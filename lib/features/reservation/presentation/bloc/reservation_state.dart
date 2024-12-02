part of 'reservation_bloc.dart';

sealed class ReservationState extends Equatable {}

final class ReservationInitialState extends ReservationState {
  @override
  List<Object?> get props => [];
}

final class ReservationLoadingState extends ReservationState {
  @override
  List<Object?> get props => [];
}

final class ReservationLoadedState extends ReservationState {
  final List<Reservation> reservations;

  ReservationLoadedState(this.reservations);

  @override
  List<Object?> get props => [reservations];
}

final class ReservationErrorState extends ReservationState {
  final String message;

  ReservationErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
