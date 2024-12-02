import 'package:fpdart/fpdart.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/features/reservation/domain/entities/reservation.dart';

abstract interface class ReservationRepository {
  Future<Either<Failure, void>> addReservation(Reservation reservation);
  Future<Either<Failure, void>> deleteReservation(String id);
  Future<Either<Failure, List<Reservation>>> getReservations();
}
