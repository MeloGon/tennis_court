import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

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
                    AppImages.court1,
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
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Epicbox'),
                      const Spacer(),
                      Text('\$25'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Cancha tipo A'),
                      const Spacer(),
                      Text('Por ahora'),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Disponible 7 am a 4 pm'),
                      const Spacer(),
                      Text('30%'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.place_outlined),
                      Text('Va Av Caracas y Ab P'),
                    ],
                  ),
                  20.h,
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        decoration: const InputDecoration(
                          hintText: 'Asss',
                          border: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: AppColors.red, width: 2)),
                        ),
                        items: [
                          DropdownMenuItem(child: Text('text')),
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
                  Text(AppStrings.setDateAndTime),
                  20.h,
                  CustomDropdown(),
                  20.h,
                  Row(
                    children: [
                      CustomDropdown(
                        width: MediaQuery.sizeOf(context).width * .4,
                      ),
                      const Spacer(),
                      CustomDropdown(
                        width: MediaQuery.sizeOf(context).width * .4,
                      ),
                    ],
                  ),
                  20.h,
                  Text(AppStrings.addComment),
                  20.h,
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black, width: .2),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextField(
                      maxLines: 4,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: AppStrings.addComment,
                      ),
                    ),
                  ),
                  30.h,
                  CustomButton(
                    onPressed: () {},
                    text: AppStrings.reserve,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
