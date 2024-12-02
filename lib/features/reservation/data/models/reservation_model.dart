import 'package:hive_ce/hive.dart';

part 'reservation_model.g.dart';

@HiveType(typeId: 0)
class ReservationModel extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? courtName;

  @HiveField(2)
  final String? courtType;

  @HiveField(3)
  final DateTime? reservationDate;

  @HiveField(4)
  final String? instructor;

  @HiveField(5)
  final String? initTime;

  @HiveField(6)
  final String? endTime;

  @HiveField(7)
  final String? price;

  @HiveField(8)
  final String? client;

  @HiveField(9)
  final String? totalTime;

  @HiveField(10)
  final String? photo;

  @HiveField(11)
  final String? comment;

  ReservationModel({
    this.id,
    this.courtName,
    this.courtType,
    this.reservationDate,
    this.instructor,
    this.initTime,
    this.endTime,
    this.price,
    this.client,
    this.totalTime,
    this.photo,
    this.comment,
  });
}
