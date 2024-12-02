part of 'court_bloc.dart';

sealed class CourtState extends Equatable {}

final class CourtInitialState extends CourtState {
  @override
  List<Object?> get props => [];
}

final class CourtLoadingState extends CourtState {
  @override
  List<Object?> get props => [];
}

final class CourtLoadedState extends CourtState {
  final List<Court> courts;
  CourtLoadedState(this.courts);
  @override
  List<Object?> get props => [courts];
}

final class CourtErrorState extends CourtState {
  final String message;
  CourtErrorState(this.message);
  @override
  List<Object?> get props => [];
}
