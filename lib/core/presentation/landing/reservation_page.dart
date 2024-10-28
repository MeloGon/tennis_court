import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/core/widgets/styled_text.dart';

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarouselSlider(
              items: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/court-1.png',
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      StyledText.headlineMedium('Epicbox'),
                      const Spacer(),
                      StyledText.headlineMedium('\$25'),
                    ],
                  ),
                  Row(
                    children: [
                      StyledText.headlineMedium('Cancha tipo A'),
                      const Spacer(),
                      StyledText.headlineMedium('Por ahora'),
                    ],
                  ),
                  Row(
                    children: [
                      StyledText.headlineMedium('Disponible 7 am a 4 pm'),
                      const Spacer(),
                      StyledText.headlineMedium('30%'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.place_outlined),
                      StyledText.headlineMedium('Va Av Caracas y Ab P'),
                    ],
                  ),
                  20.h,
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          hintText: 'Asss',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 2)),
                        ),
                        items: [
                          DropdownMenuItem(
                              child: StyledText.bodyMedium('text')),
                        ],
                        onChanged: (value) {}),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyledText.bodyLarge('Establecer fecha y hora'),
                  20.h,
                  DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      items: [
                        DropdownMenuItem(child: StyledText.bodyMedium('text'))
                      ],
                      onChanged: (value) {}),
                  20.h,
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .4,
                        child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            items: [
                              DropdownMenuItem(
                                  child: StyledText.bodyMedium('text'))
                            ],
                            onChanged: (value) {}),
                      ),
                      const Spacer(),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * .4,
                        child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            items: [
                              DropdownMenuItem(
                                  child: StyledText.bodyMedium('text'))
                            ],
                            onChanged: (value) {}),
                      ),
                    ],
                  ),
                  20.h,
                  StyledText.bodyLarge('Agregar un comentario'),
                  20.h,
                  TextField(
                    maxLines: 4,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
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
