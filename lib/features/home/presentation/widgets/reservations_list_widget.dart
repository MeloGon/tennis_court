import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/home/presentation/widgets/reservation_widget.dart';
import 'package:tennis_court/features/reservation/presentation/bloc/reservation_bloc.dart';

class ReservationsListWidget extends StatelessWidget {
  const ReservationsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationBloc, ReservationState>(
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
              return ReservationWidget(
                reservation: reservation,
              );
            },
          );
        } else if (state is ReservationErrorState) {
          return Center(child: Text(state.message));
        }
        return const Center(child: Text(AppStrings.loading));
      },
    );
  }
}
