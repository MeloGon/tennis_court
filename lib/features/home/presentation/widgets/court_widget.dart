import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/reservation/presentation/bloc/reservation_bloc.dart';

import 'package:tennis_court/global_widgets/custom_button.dart';

class CourtWidget extends StatelessWidget {
  final Court court;
  const CourtWidget({super.key, required this.court});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * .8,
      child: Card(
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.grey.withOpacity(.2), width: .3),
            borderRadius: BorderRadius.circular(12),
          ),
          color: AppColors.white,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  court.imageUrl!,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      court.name ?? '',
                      style: context.bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w500),
                    ),
                    10.h,
                    Text(
                      court.type ?? '',
                      style: context.bodySmall?.copyWith(
                          fontWeight: FontWeight.w400, letterSpacing: .1),
                    ),
                    10.h,
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImages.calendarIcon,
                        ),
                        5.w,
                        Text(
                          '9 de Julio 2024',
                          style: context.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400, letterSpacing: .1),
                        ),
                      ],
                    ),
                    10.h,
                    Row(
                      children: [
                        Text(
                          AppStrings.available,
                          style: context.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400, letterSpacing: .1),
                        ),
                        10.w,
                        SvgPicture.asset(
                          AppImages.clockIcon,
                        ),
                        5.w,
                        Text(
                          court.availability ?? '',
                          style: context.bodySmall?.copyWith(
                              fontWeight: FontWeight.w400, letterSpacing: .1),
                        ),
                      ],
                    ),
                    30.h,
                    CustomButton(
                      marginH: MediaQuery.sizeOf(context).width * .06,
                      height: 30,
                      borderRadius: 4,
                      fontSize: 14,
                      onPressed: () {
                        context.read<RouterCubit>().goToReservation(court);
                      },
                      text: AppStrings.reserve,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
