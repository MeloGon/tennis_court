import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/reserve/domain/entities/reservation.dart';
import 'package:tennis_court/features/reserve/domain/repositories/reservation_repository.dart';

class GetReservationsUsecase implements UseCase<List<Reservation>, NoParams> {
  final ReservationRepository reservationRepository;
  GetReservationsUsecase(this.reservationRepository);

  @override
  Future<Either<Failure, List<Reservation>>> call(NoParams params) async =>
      await reservationRepository.getReservations();
}
