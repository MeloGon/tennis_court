import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/home/presentation/bloc/court_bloc.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          20.h,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Mis favoritos',
              style: context.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          20.h,
          BlocBuilder<CourtBloc, CourtState>(
            builder: (context, state) {
              if (state is CourtLoadedState) {
                final favoriteCourts = state.courts
                    .where((court) => (court.isFavorite ?? false))
                    .toList();

                if (favoriteCourts.isEmpty) {
                  return const Center(child: Text('No hay favoritos.'));
                }

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: favoriteCourts.length,
                  itemBuilder: (context, index) {
                    final court = favoriteCourts[index];
                    return CourtWidget(
                      court: court,
                    );
                  },
                );
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
