import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/reservation/domain/entities/reservation.dart';

class ReservationWidget extends StatelessWidget {
  final Reservation reservation;
  const ReservationWidget({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: DecoratedBox(
        decoration: const BoxDecoration(color: AppColors.blueLightF4F7FC),
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox.square(
              dimension: 60,
              child: Image.asset(
                reservation.photo ?? '',
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text(
            reservation.courtName ?? '',
            style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              6.h,
              if (reservation.reservationDate != null)
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.calendarIcon,
                    ),
                    6.w,
                    Text(
                      DateFormat.yMMMd().format(reservation.reservationDate!),
                      style: context.bodySmall,
                    ),
                  ],
                ),
              6.h,
              Row(
                children: [
                  Text(
                    'Reservado por',
                    style: context.bodySmall,
                  ),
                  5.w,
                  Image.asset(
                    AppImages.profile,
                    width: 14,
                  ),
                  5.w,
                  Text(
                    'Andrea Gomez',
                    style: context.bodySmall,
                  ),
                ],
              ),
              if (reservation.price != null)
                Text(
                  '\$${reservation.price}',
                  style: context.bodySmall,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
