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
//

final class UpdateReservationDateEvent extends ReservationEvent {
  final DateTime date;

  const UpdateReservationDateEvent(this.date);

  @override
  List<Object?> get props => [date];
}

final class UpdateReservationStartTimeEvent extends ReservationEvent {
  final String startTime;

  const UpdateReservationStartTimeEvent(this.startTime);

  @override
  List<Object?> get props => [startTime];
}

final class UpdateReservationEndTimeEvent extends ReservationEvent {
  final String endTime;

  const UpdateReservationEndTimeEvent(this.endTime);

  @override
  List<Object?> get props => [endTime];
}

final class UpdateReservationInstructorEvent extends ReservationEvent {
  final String instructor;

  const UpdateReservationInstructorEvent(this.instructor);

  @override
  List<Object?> get props => [instructor];
}

final class UpdateReservationCommentEvent extends ReservationEvent {
  final String comment;

  const UpdateReservationCommentEvent(this.comment);

  @override
  List<Object?> get props => [comment];
}

final class SubmitReservationEvent extends ReservationEvent {
  @override
  List<Object?> get props => [];
}
