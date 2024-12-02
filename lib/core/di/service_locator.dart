import 'package:get_it/get_it.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/features/reserve/data/repositories/reservation_repository_impl.dart';
import 'package:tennis_court/features/reserve/domain/repositories/reservation_repository.dart';
import 'package:tennis_court/features/reserve/domain/usecases/add_reservation_usecase.dart';
import 'package:tennis_court/features/reserve/domain/usecases/delete_reservation_usecase.dart';
import 'package:tennis_court/features/reserve/domain/usecases/get_reservations_usecase.dart';
import 'package:tennis_court/features/reserve/presentation/bloc/reservation_bloc.dart';

GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton(RouterCubit());

  getIt.registerLazySingleton<ReservationRepository>(
      () => ReservationRepositoryImpl(getIt()));
  getIt.registerLazySingleton<GetReservationsUsecase>(
      () => GetReservationsUsecase(getIt()));
  getIt.registerLazySingleton<DeleteReservationUsecase>(
      () => DeleteReservationUsecase(getIt()));
  getIt.registerLazySingleton<AddReservationUsecase>(
      () => AddReservationUsecase(getIt()));
  getIt.registerSingleton(ReservationBloc());
}
