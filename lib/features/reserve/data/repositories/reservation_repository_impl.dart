import 'package:flutter/material.dart';
import 'package:fpdart/src/either.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:tennis_court/core/error/exceptions.dart';
import 'package:tennis_court/core/error/failure.dart';
import 'package:tennis_court/core/extensions/reservation_extension.dart';
import 'package:tennis_court/features/reserve/data/models/reservation_model.dart';
import 'package:tennis_court/features/reserve/domain/entities/reservation.dart';
import 'package:tennis_court/features/reserve/domain/repositories/reservation_repository.dart';

class ReservationRepositoryImpl implements ReservationRepository {
  final Box<ReservationModel> box;
  ReservationRepositoryImpl(this.box);

  @override
  Future<Either<Failure, void>> addReservation(Reservation reservation) async {
    try {
      final reservationModel = ReservationModel(
        courtName: reservation.courtName,
        courtType: reservation.courtType,
        reservationDate: reservation.reservationDate,
        instructor: reservation.instructor,
        initTime: reservation.initTime,
        endTime: reservation.endTime,
        price: reservation.price,
        client: reservation.client,
        totalTime: reservation.totalTime,
        photo: reservation.photo,
        comment: reservation.comment,
      );
      await box.add(reservationModel);
      return right(
        // ignore: void_checks
        const SnackBar(
          content: Text('añadido con extio'),
        ),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReservation(String id) async {
    try {
      await box.delete(id);
      return right(
        // ignore: void_checks
        const SnackBar(
          content: Text('eliminado con extio'),
        ),
      );
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<Reservation>>> getReservations() async {
    try {
      return right(box.values.map((model) => model.toEntity()).toList());
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
