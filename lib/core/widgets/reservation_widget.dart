import 'package:flutter/material.dart';
import 'package:tennis_court/core/widgets/widgets.dart';

class ReservationWidget extends StatelessWidget {
  const ReservationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: const Color(0xffF4F7FC),
      // leading: SizedBox.square(
      //   dimension: 60,
      //   child: Image.asset(
      //     'assets/court-2.png',
      //     fit: BoxFit.fitHeight,
      //   ),
      // ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox.square(
          dimension: 60,
          child: Image.asset(
            "assets/court-1.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: StyledText.bodyMedium('EpicBox'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyledText.bodyMedium('EpicBox'),
          StyledText.bodyMedium('EpicBox'),
          StyledText.bodyMedium('EpicBox')
        ],
      ),
    );
  }
}
