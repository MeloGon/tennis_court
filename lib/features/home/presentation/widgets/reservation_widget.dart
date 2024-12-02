import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/reservation/domain/entities/reservation.dart';

class ReservationWidget extends StatelessWidget {
  final Reservation reservation;
  const ReservationWidget({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.blueLightF4F7FC),
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox.square(
            dimension: 60,
            child: Image.asset(
              AppImages.court1,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(reservation.initTime ?? ''),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(reservation.courtName ?? ''),
            6.h,
            Text(reservation.reservationDate.toString()),
            6.h,
            Text(reservation.client ?? ''),
            6.h,
            Text(reservation.totalTime ?? '')
          ],
        ),
      ),
    );
  }
}
