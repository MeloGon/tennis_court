import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';

class CustomTextfield extends StatelessWidget {
  final String? label;
  final TextStyle? hintStyle;
  final String? hint;
  final Widget? icon;
  final Widget? suffixIcon;

  const CustomTextfield(
      {super.key,
      this.label,
      this.icon,
      this.hint,
      this.hintStyle,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              label!,
              style: context.bodySmall?.copyWith(color: AppColors.grey),
            ),
          ),
        TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: hintStyle ?? context.bodyMedium,
            contentPadding: const EdgeInsets.only(top: 13),
            prefixIcon: icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      10.w,
                      icon!,
                      8.w,
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.black87,
                      )
                    ],
                  )
                : null,
            suffixIcon: suffixIcon,
          ),
          onChanged: (value) {
            // formBloc
            //     .add(ValidateFormEvent(username: value, password: ''));
          },
        ),
      ],
    );
  }
}
