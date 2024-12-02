import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tennis_court/features/reservations/presentation/widgets/reservation_tab_item_widget.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h,
          Text(
            'Mis reservas',
            style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          10.h,
          BlocBuilder<ReservationBloc, ReservationState>(
            builder: (context, state) {
              if (state is ReservationLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ReservationLoadedState) {
                if (state.reservations.isEmpty) {
                  return const Center(child: Text(AppStrings.withoutReserves));
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: state.reservations.length,
                  itemBuilder: (context, index) {
                    final reservation = state.reservations[index];
                    return ReservationTabItemWidget(
                      reservation: reservation,
                    );
                  },
                );
              } else if (state is ReservationErrorState) {
                return Center(child: Text(state.message));
              }
              return const Center(child: Text(AppStrings.loading));
            },
          )
        ],
      ),
    );
  }
}
