import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';

import 'package:tennis_court/global_widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DecoratedBox(
        position: DecorationPosition.background,
        decoration: const BoxDecoration(color: AppColors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'Hola Andrea!',
                style: context.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                AppStrings.courts,
                style: context.headlineSmall
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 404,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [CourtWidget(), CourtWidget(), CourtWidget()],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                AppStrings.scheduledReservations,
                style: context.headlineSmall
                    ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            5.h,
            ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                ReservationWidget(),
                10.h,
                ReservationWidget(),
                10.h,
                ReservationWidget(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
