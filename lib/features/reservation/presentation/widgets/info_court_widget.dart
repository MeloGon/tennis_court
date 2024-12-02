import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/home/domain/entities/court.dart';

class InfoCourtWidget extends StatefulWidget {
  final Court? court;
  const InfoCourtWidget({super.key, this.court});

  @override
  State<InfoCourtWidget> createState() => _InfoCourtWidgetState();
}

class _InfoCourtWidgetState extends State<InfoCourtWidget> {
  String? selectedInstructor;

  final List<String> instructorOptions = [
    'Instructor 1',
    'Instructor 2',
    'Instructor 3',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                widget.court?.name ?? '',
                style: context.headlineSmall
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Text(
                '\$25',
                style: context.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w600, color: AppColors.blue346BC3),
              ),
            ],
          ),
          10.h,
          Row(
            children: [
              Text(
                widget.court?.type ?? '',
                style: context.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w400, letterSpacing: .1),
              ),
              const Spacer(),
              Text(
                AppStrings.forNow,
                style: context.bodySmall?.copyWith(color: AppColors.grey),
              ),
            ],
          ),
          10.h,
          Row(
            children: [
              Text(
                'Disponible ',
                style: context.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w400, letterSpacing: .1),
              ),
              10.w,
              SvgPicture.asset(
                AppImages.clockIcon,
              ),
              10.w,
              Text(
                widget.court?.availability ?? '',
                style: context.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w400, letterSpacing: .1),
              ),
              const Spacer(),
              const Text('30%'),
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
                style: context.bodySmall
                    ?.copyWith(fontWeight: FontWeight.w400, letterSpacing: .1),
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
                  hintText: 'Agregar Instructor',
                  border: OutlineInputBorder(),
                ),
                items: instructorOptions.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedInstructor = value;
                  });
                }),
          ),
        ],
      ),
    );
  }
}
