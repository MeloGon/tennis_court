part of 'court_bloc.dart';

sealed class CourtEvent extends Equatable {
  const CourtEvent();
}

final class LoadCourtsEvent extends CourtEvent {
  @override
  List<Object?> get props => [];
}
