import 'package:flutter/material.dart';
import 'package:tennis_court/core/config.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? marginV;
  final double? marginH;
  final Icon? icon;
  final bool enabled;
  final void Function() onPressed;
  final double? width;
  final double? height;
  final double? fontSize;
  final double? borderRadius;
  const CustomButton(
      {super.key,
      this.text,
      this.color = AppColors.greenPrimary,
      this.marginV,
      this.marginH,
      this.enabled = true,
      required this.onPressed,
      this.icon,
      this.width,
      this.height = 53,
      this.fontSize = 20,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: marginH ?? 0, vertical: marginV ?? 0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            elevation: 0,
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius ?? 15),
              ),
            ),
          ),
          onPressed: enabled ? onPressed : null,
          child: SizedBox(
            width: width,
            height: height,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon ?? const SizedBox.shrink(),
                  if (text != null)
                    Text(
                      text!,
                      style: TextStyle(
                          color: AppColors.white,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w600),
                    )
                ],
              ),
            ),
          )),
    );
  }
}
