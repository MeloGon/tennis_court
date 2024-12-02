import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/reservation/domain/entities/reservation.dart';
import 'package:tennis_court/features/reservation/domain/repositories/reservation_repository.dart';

class AddReservationUsecase implements UseCase<void, Reservation> {
  final ReservationRepository reservationRepository;
  AddReservationUsecase(this.reservationRepository);

  @override
  Future<Either<Failure, void>> call(Reservation reservation) async =>
      await reservationRepository.addReservation(reservation);
}
