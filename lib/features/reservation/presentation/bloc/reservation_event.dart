part of 'reservation_bloc.dart';

sealed class ReservationEvent extends Equatable {
  const ReservationEvent();
}

final class LoadReservationsEvent extends ReservationEvent {
  @override
  List<Object?> get props => [];
}

final class AddReservationEvent extends ReservationEvent {
  final Reservation reservation;

  const AddReservationEvent(this.reservation);

  @override
  List<Object?> get props => [reservation];
}

final class DeleteReservationEvent extends ReservationEvent {
  final String id;

  const DeleteReservationEvent(this.id);

  @override
  List<Object?> get props => [id];
}
