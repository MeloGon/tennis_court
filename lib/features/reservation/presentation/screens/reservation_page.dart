import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tennis_court/features/reservation/presentation/widgets/date_selector_widget.dart';
import 'package:tennis_court/features/reservation/presentation/widgets/header_court_widget.dart';
import 'package:tennis_court/features/reservation/presentation/widgets/info_court_widget.dart';
import 'package:tennis_court/features/reservation/presentation/widgets/inputs_reservation_widget.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class ReservationPage extends StatelessWidget {
  final Court? court;
  const ReservationPage({super.key, this.court});

  @override
  Widget build(BuildContext context) {
    context.read<ReservationBloc>().add(ChargeCourtDataEvent(court!));
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderCourtWidget(court: court),
            InfoCourtWidget(court: court),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.setDateAndTime,
                    style: context.headlineSmall
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  20.h,
                  const DateSelectorWidget(),
                  20.h,
                  const InputsReservationWidget(),
                  30.h,
                  CustomButton(
                    onPressed: () {
                      context
                          .read<ReservationBloc>()
                          .add(SubmitReservationEvent());
                    },
                    text: AppStrings.reserve,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
