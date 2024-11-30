import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/core/extensions/extensions.dart';

import 'package:tennis_court/features/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text('Hola Andrea!'),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(AppStrings.courts),
          ),
          SizedBox(
            height: 490,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [CourtWidget(), CourtWidget(), CourtWidget()],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(AppStrings.scheduledReservations),
          ),
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
    );
  }
}
