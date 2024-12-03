import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/features/favorites/domain/usecases/add_favorite_usecase.dart';
import 'package:tennis_court/features/favorites/domain/usecases/get_favorites_usecase.dart';
import 'package:tennis_court/features/favorites/domain/usecases/remove_favorite_usecase.dart';
import 'package:tennis_court/features/home/data/datasources/local_court_datasource.dart';
import 'package:tennis_court/features/home/data/repositories/court_repository_impl.dart';
import 'package:tennis_court/features/home/domain/repositories/court_repository.dart';
import 'package:tennis_court/features/home/domain/usecases/get_courts_usecases.dart';
import 'package:tennis_court/features/home/presentation/bloc/court_bloc.dart';
import 'package:tennis_court/features/reservation/data/models/reservation_model.dart';
import 'package:tennis_court/features/reservation/data/repositories/reservation_repository_impl.dart';
import 'package:tennis_court/features/reservation/domain/repositories/reservation_repository.dart';
import 'package:tennis_court/features/reservation/domain/usecases/add_reservation_usecase.dart';
import 'package:tennis_court/features/reservation/domain/usecases/delete_reservation_usecase.dart';
import 'package:tennis_court/features/reservation/domain/usecases/get_reservations_usecase.dart';
import 'package:tennis_court/features/reservation/presentation/bloc/reservation_bloc.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() async {
  getIt.registerSingleton(RouterCubit());
  //reservation
  final revervationsBox = await Hive.openBox<ReservationModel>("reservations");
  getIt.registerLazySingleton(() => revervationsBox);
  getIt.registerLazySingleton<ReservationRepository>(
      () => ReservationRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetReservationsUsecase>(
      () => GetReservationsUsecase(getIt()));
  getIt.registerLazySingleton<DeleteReservationUsecase>(
      () => DeleteReservationUsecase(getIt()));
  getIt.registerLazySingleton<AddReservationUsecase>(
      () => AddReservationUsecase(getIt()));
  getIt.registerSingleton(ReservationBloc()..loadReservations());
  //court
  getIt.registerLazySingleton<LocalCourtDataSource>(
      () => LocalCourtDataSourceImpl());
  getIt.registerLazySingleton<CourtRepository>(
      () => CourtRepositoryImpl(getIt()));
  getIt
      .registerLazySingleton<GetCourtsUsecase>(() => GetCourtsUsecase(getIt()));
  getIt.registerSingleton(CourtBloc()..loadCourts());
  //favorite
  getIt.registerLazySingleton<AddFavoriteUsecase>(
      () => AddFavoriteUsecase(getIt()));
  getIt.registerLazySingleton<RemoveFavoriteUsecase>(
      () => RemoveFavoriteUsecase(getIt()));
  getIt.registerLazySingleton<GetFavoritesUsecase>(
      () => GetFavoritesUsecase(getIt()));
}
