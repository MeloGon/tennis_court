import 'package:flutter/material.dart';
import 'package:tennis_court/core/extensions/extensions.dart';
import 'package:tennis_court/core/widgets/widgets.dart';

class CustomTextfield extends StatelessWidget {
  final String? label;
  final Icon? icon;
  const CustomTextfield({super.key, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: StyledText.bodySmall(label!),
          ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: icon != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      10.w,
                      icon!,
                      5.w,
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.black87,
                      )
                    ],
                  )
                : null,
          ),
          onChanged: (value) {
            // Dispatch event to validate form when the username changes
            // formBloc
            //     .add(ValidateFormEvent(username: value, password: ''));
          },
        ),
      ],
    );
  }
}
