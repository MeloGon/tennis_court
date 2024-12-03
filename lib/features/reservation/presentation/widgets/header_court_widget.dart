import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/home/presentation/bloc/court_bloc.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class HeaderCourtWidget extends StatelessWidget {
  final Court? court;
  const HeaderCourtWidget({super.key, this.court});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                court!.imageUrl!,
                fit: BoxFit.cover,
              ),
            )
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            height: MediaQuery.sizeOf(context).height * 0.3,
            autoPlay: true,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: AppColors.white,
                ),
                onPressed: () {
                  context.read<RouterCubit>().goBack();
                },
                width: 30,
              ),
              BlocBuilder<CourtBloc, CourtState>(
                builder: (context, state) {
                  if (state is CourtLoadedState) {
                    final updatedCourt =
                        state.courts.firstWhere((c) => c.id == court!.id);

                    return IconButton(
                      onPressed: () {
                        context
                            .read<CourtBloc>()
                            .add(ToggleFavoriteEvent(court!.id!));
                        final message = updatedCourt.isFavorite ?? false
                            ? 'Eliminado de favoritos'
                            : 'Añadido a favoritos';

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message)),
                        );
                      },
                      icon: updatedCourt.isFavorite ?? false
                          ? const Icon(
                              Icons.favorite,
                              color: AppColors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: AppColors.white,
                            ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            ],
          ),
        )
      ],
    );
  }
}
