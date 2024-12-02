import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_court/config/router/app_router.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';
import 'package:tennis_court/features/reservation/presentation/widgets/date_selector_widget.dart';
import 'package:tennis_court/global_widgets/date_reservation_widget.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class ReservationPage extends StatelessWidget {
  final Court? court;
  const ReservationPage({super.key, this.court});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
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
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyHomePage(
                                  title: '',
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.favorite_border,
                            color: AppColors.white,
                          ))
                    ],
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              color: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        court?.name ?? '',
                        style: context.headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        '\$25',
                        style: context.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.blue346BC3),
                      ),
                    ],
                  ),
                  10.h,
                  Row(
                    children: [
                      Text(
                        court?.type ?? '',
                        style: context.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400, letterSpacing: .1),
                      ),
                      const Spacer(),
                      Text(
                        AppStrings.forNow,
                        style:
                            context.bodySmall?.copyWith(color: AppColors.grey),
                      ),
                    ],
                  ),
                  10.h,
                  Row(
                    children: [
                      Text(
                        'Disponible ',
                        style: context.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400, letterSpacing: .1),
                      ),
                      10.w,
                      SvgPicture.asset(
                        AppImages.clockIcon,
                      ),
                      10.w,
                      Text(
                        court?.availability ?? '',
                        style: context.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400, letterSpacing: .1),
                      ),
                      const Spacer(),
                      Text('30%'),
                    ],
                  ),
                  10.h,
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImages.placeIcon,
                      ),
                      5.w,
                      Text(
                        'Va Av Caracas y Ab P',
                        style: context.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400, letterSpacing: .1),
                      ),
                    ],
                  ),
                  20.h,
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * .5,
                    child: DropdownButtonFormField<String>(
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 3.0,
                          ),
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
                  Text(
                    AppStrings.setDateAndTime,
                    style: context.headlineSmall
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  20.h,
                  DateSelectorWidget(),
                  20.h,
                  Row(
                    children: [
                      CustomDropdown(
                        width: MediaQuery.sizeOf(context).width * .4,
                        label: AppStrings.initTime,
                      ),
                      const Spacer(),
                      CustomDropdown(
                        width: MediaQuery.sizeOf(context).width * .4,
                        label: AppStrings.endTime,
                      ),
                    ],
                  ),
                  20.h,
                  Text(
                    AppStrings.addComment,
                    style: context.headlineSmall
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  20.h,
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.greyEEEFF1, width: .2),
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white),
                    child: TextField(
                      textInputAction: TextInputAction.done,
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
                  ),
                  // widget(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
