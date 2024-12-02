import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/core/usecase/usecase.dart';
import 'package:tennis_court/features/reservation/domain/repositories/reservation_repository.dart';

class DeleteReservationUsecase implements UseCase<void, String> {
  final ReservationRepository reservationRepository;
  DeleteReservationUsecase(this.reservationRepository);

  @override
  Future<Either<Failure, void>> call(String id) async =>
      await reservationRepository.deleteReservation(id);
}
