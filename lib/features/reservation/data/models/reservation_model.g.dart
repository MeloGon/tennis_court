// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReservationModelAdapter extends TypeAdapter<ReservationModel> {
  @override
  final int typeId = 0;

  @override
  ReservationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReservationModel(
      id: fields[0] as String?,
      courtName: fields[1] as String?,
      courtType: fields[2] as String?,
      reservationDate: fields[3] as DateTime?,
      instructor: fields[4] as String?,
      initTime: fields[5] as String?,
      endTime: fields[6] as String?,
      price: fields[7] as String?,
      client: fields[8] as String?,
      totalTime: fields[9] as String?,
      photo: fields[10] as String?,
      comment: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ReservationModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.courtName)
      ..writeByte(2)
      ..write(obj.courtType)
      ..writeByte(3)
      ..write(obj.reservationDate)
      ..writeByte(4)
      ..write(obj.instructor)
      ..writeByte(5)
      ..write(obj.initTime)
      ..writeByte(6)
      ..write(obj.endTime)
      ..writeByte(7)
      ..write(obj.price)
      ..writeByte(8)
      ..write(obj.client)
      ..writeByte(9)
      ..write(obj.totalTime)
      ..writeByte(10)
      ..write(obj.photo)
      ..writeByte(11)
      ..write(obj.comment);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
