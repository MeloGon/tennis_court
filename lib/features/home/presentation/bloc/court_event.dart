part of 'court_bloc.dart';

sealed class CourtEvent extends Equatable {
  const CourtEvent();
}

final class LoadCourtsEvent extends CourtEvent {
  @override
  List<Object?> get props => [];
}

final class ToggleFavoriteEvent extends CourtEvent {
  final String courtId;

  const ToggleFavoriteEvent(this.courtId);

  @override
  List<Object?> get props => [courtId];
}
