import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/features/widgets/custom_button.dart';

class CourtWidget extends StatelessWidget {
  const CourtWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/court-1.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'postItem.title',
                          // style: const TextStyle(
                          //     fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    10.h,
                    Text('Cancha tipo A'),
                    10.h,
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined),
                        5.w,
                        Text('9 de julio 2024'),
                      ],
                    ),
                    10.h,
                    Text('Disponible 7:00 am a 4:00 pm '),
                    30.h,
                    CustomButton(
                      marginH: 60,
                      height: 30,
                      fontSize: 20,
                      onPressed: () {
                        context.read<RouterCubit>().goToReservation();
                      },
                      text: 'Reservar',
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
