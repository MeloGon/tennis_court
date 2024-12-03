import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court/core/config.dart';
import 'package:tennis_court/features/reservation/presentation/bloc/reservation_bloc.dart';
import 'package:tennis_court/global_widgets/widgets.dart';

class InputsReservationWidget extends StatefulWidget {
  const InputsReservationWidget({super.key});

  @override
  State<InputsReservationWidget> createState() =>
      _InputsReservationWidgetState();
}

class _InputsReservationWidgetState extends State<InputsReservationWidget> {
  String? selectedStartTime, selectedEndTime;

  final List<String> hourOptions = [
    '07:00 am',
    '08:00 am',
    '09:00 am',
    '10:00 am',
    '11:00 am',
    '12:00 pm',
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomDropdown(
              width: MediaQuery.sizeOf(context).width * .4,
              label: AppStrings.initTime,
              items: hourOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedEndTime = newValue;
                  context.read<ReservationBloc>().add(
                        UpdateReservationStartTimeEvent(selectedEndTime!),
                      );
                });
              },
              hint: Text(
                '00:00',
                style: context.bodyMedium?.copyWith(color: AppColors.grey),
              ),
            ),
            const Spacer(),
            CustomDropdown(
              width: MediaQuery.sizeOf(context).width * .4,
              label: AppStrings.endTime,
              items: hourOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedEndTime = newValue;
                  context.read<ReservationBloc>().add(
                        UpdateReservationEndTimeEvent(selectedEndTime!),
                      );
                });
              },
              hint: Text(
                '00:00',
                style: context.bodyMedium?.copyWith(color: AppColors.grey),
              ),
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
              border: Border.all(color: AppColors.greyEEEFF1, width: .2),
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white),
          child: TextField(
            textInputAction: TextInputAction.done,
            maxLines: 4,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: AppStrings.addComment,
            ),
            onChanged: (value) {
              context
                  .read<ReservationBloc>()
                  .add(UpdateReservationCommentEvent(value));
            },
          ),
        ),
      ],
    );
  }
}
