import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:tennis_court/core/config.dart';

class DateSelectorWidget extends StatefulWidget {
  const DateSelectorWidget({super.key});

  @override
  State<DateSelectorWidget> createState() => _DateSelectorWidgetState();
}

class _DateSelectorWidgetState extends State<DateSelectorWidget> {
  DateTime _currentDate = DateTime.now();
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: AppColors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Fecha'),
                  Text('09/12/2024'),
                ],
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                child: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                ),
              )
            ],
          ),
        ),
        (isOpen)
            ? AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: (isOpen)
                    ? CalendarCarousel<Event>(
                        onDayPressed: (DateTime date, List<Event> events) {},
                        locale: 'es',
                        weekendTextStyle: context.bodySmall,
                        thisMonthDayBorderColor: AppColors.blueLightF5F8FB,
                        daysTextStyle: context.bodySmall,
                        weekdayTextStyle:
                            context.bodySmall?.copyWith(color: AppColors.grey),
                        headerTextStyle: context.bodySmall,
                        dayButtonColor: AppColors.blueLightF5F8FB,
                        selectedDayBorderColor: AppColors.blue346BC3,
                        selectedDayButtonColor: AppColors.blue346BC3,
                        headerMargin: const EdgeInsets.only(bottom: 0),
                        leftButtonIcon: const Icon(
                          Icons.arrow_back_ios,
                          size: 17,
                        ),
                        rightButtonIcon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                        ),
                        weekFormat: false,
                        height: 410.0,
                        selectedDateTime: _currentDate,
                        daysHaveCircularBorder: true,
                      )
                    : CalendarCarousel<Event>(
                        onDayPressed: (DateTime date, List<Event> events) {},
                        locale: 'es',
                        weekendTextStyle: context.bodySmall,
                        thisMonthDayBorderColor: AppColors.blueLightF5F8FB,
                        daysTextStyle: context.bodySmall,
                        weekdayTextStyle:
                            context.bodySmall?.copyWith(color: AppColors.grey),
                        headerTextStyle: context.bodySmall,
                        dayButtonColor: AppColors.blueLightF5F8FB,
                        selectedDayBorderColor: AppColors.blue346BC3,
                        selectedDayButtonColor: AppColors.blue346BC3,
                        headerMargin: const EdgeInsets.only(bottom: 0),
                        leftButtonIcon: const Icon(
                          Icons.arrow_back_ios,
                          size: 17,
                        ),
                        rightButtonIcon: const Icon(
                          Icons.arrow_forward_ios,
                          size: 17,
                        ),
                        weekFormat: false,
                        height: 0,
                        selectedDateTime: _currentDate,
                        daysHaveCircularBorder: true,
                      ))
            : const SizedBox.shrink(),
      ],
    );
  }
}
