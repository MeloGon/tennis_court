import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/home/presentation/bloc/court_bloc.dart';

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
            BlocBuilder<CourtBloc, CourtState>(
              builder: (context, state) {
                if (state is CourtLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CourtLoadedState) {
                  return SizedBox(
                    height: 404,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.courts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final court = state.courts[index];
                        return CourtWidget(
                          court: court,
                        );
                      },
                    ),
                  );
                } else if (state is CourtErrorState) {
                  return Center(child: Text(state.message));
                }
                return Center(child: Text('Cargando...'));
              },
            ),
            // SizedBox(
            //   height: 404,
            //   child: ListView(
            //     scrollDirection: Axis.horizontal,
            //     shrinkWrap: true,
            //     children: [CourtWidget(), CourtWidget(), CourtWidget()],
            //   ),
            // ),

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
