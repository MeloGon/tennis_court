import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';

class ReservationWidget extends StatelessWidget {
  final String? title;
  final String? reservationDate;
  final String? reservationBy;
  final String? reservationTime;
  final String? reservationCost;
  const ReservationWidget(
      {super.key,
      this.title,
      this.reservationDate,
      this.reservationBy,
      this.reservationTime,
      this.reservationCost});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColors.blueLightF4F7FC),
      child: ListTile(
        onTap: () {},
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
        title: Text('EpicBox'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('EpicBox'),
            6.h,
            Text('EpicBox'),
            6.h,
            Text('EpicBox')
          ],
        ),
      ),
    );
  }
}
