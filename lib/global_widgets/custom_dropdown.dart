import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';

class CustomDropdown extends StatelessWidget {
  final String? label;
  final double? width;
  final Widget? hint;
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;
  const CustomDropdown(
      {super.key,
      this.width = double.infinity,
      this.label,
      required this.items,
      required this.onChanged,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: width,
      height: 62,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.greyEEEFF1, width: .2),
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            child: Text(
              label ?? '',
              style: context.bodyMedium,
            ),
          ),
          Column(
            children: [
              8.h,
              DropdownButtonFormField<String>(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  decoration: const InputDecoration(border: InputBorder.none),
                  hint: hint,
                  items: items,
                  onChanged: onChanged),
            ],
          ),
        ],
      ),
    );
  }
}
