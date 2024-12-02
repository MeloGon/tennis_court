import 'package:tennis_court/features/reserve/data/models/reservation_model.dart';
import 'package:tennis_court/features/reserve/domain/entities/reservation.dart';

extension ReservationModelMapper on ReservationModel {
  Reservation toEntity() {
    return Reservation(
      id: id,
      courtName: courtName,
      courtType: courtType,
      reservationDate: reservationDate,
      instructor: instructor,
      initTime: initTime,
      endTime: endTime,
      price: price,
      client: client,
      totalTime: totalTime,
      photo: photo,
      comment: comment,
    );
  }
}
