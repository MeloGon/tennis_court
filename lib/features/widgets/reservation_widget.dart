import 'package:flutter/material.dart';
import 'package:tennis_court/features/widgets/widgets.dart';

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
      title: Text('EpicBox'),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text('EpicBox'), Text('EpicBox'), Text('EpicBox')],
      ),
    );
  }
}
