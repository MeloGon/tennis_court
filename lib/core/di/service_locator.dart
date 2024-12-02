import 'package:get_it/get_it.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/features/home/data/datasources/local_court_datasource.dart';
import 'package:tennis_court/features/home/data/repositories/court_repository_impl.dart';
import 'package:tennis_court/features/home/domain/repositories/court_repository.dart';
import 'package:tennis_court/features/home/domain/usecases/get_courts_usecases.dart';
import 'package:tennis_court/features/home/presentation/bloc/court_bloc.dart';
import 'package:tennis_court/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:tennis_court/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:tennis_court/features/reservation/domain/usecases/add_reservation_usecase.dart';
import 'package:tennis_court/features/reservation/domain/usecases/delete_reservation_usecase.dart';
import 'package:tennis_court/features/reservation/domain/usecases/get_reservations_usecase.dart';
import 'package:tennis_court/features/reservation/presentation/bloc/reservation_bloc.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(RouterCubit());
  //reservation
  getIt.registerLazySingleton<ReservationRepository>(
      () => ReservationRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetReservationsUsecase>(
      () => GetReservationsUsecase(getIt()));
  getIt.registerLazySingleton<DeleteReservationUsecase>(
      () => DeleteReservationUsecase(getIt()));
  getIt.registerLazySingleton<AddReservationUsecase>(
      () => AddReservationUsecase(getIt()));
  getIt.registerSingleton(ReservationBloc());
  //court
  getIt.registerLazySingleton<LocalCourtDataSource>(
      () => LocalCourtDataSourceImpl());
  getIt.registerLazySingleton<CourtRepository>(
      () => CourtRepositoryImpl(getIt()));
  getIt
      .registerLazySingleton<GetCourtsUsecase>(() => GetCourtsUsecase(getIt()));
  getIt.registerSingleton(CourtBloc()..loadCourts());
}
