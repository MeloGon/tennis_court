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

final class ReservationFormState extends ReservationState {
  final DateTime? date;
  final String? startTime;
  final String? endTime;
  final String? instructor;
  final String? comment;

  ReservationFormState({
    this.date,
    this.startTime,
    this.endTime,
    this.instructor,
    this.comment,
  });

  ReservationFormState copyWith({
    DateTime? date,
    String? startTime,
    String? endTime,
    String? instructor,
    String? comment,
  }) {
    return ReservationFormState(
      date: date ?? this.date,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      instructor: instructor ?? this.instructor,
      comment: comment ?? this.comment,
    );
  }

  @override
  List<Object?> get props => [date, startTime, endTime, instructor, comment];
}
