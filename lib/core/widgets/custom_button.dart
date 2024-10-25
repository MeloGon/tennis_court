import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? marginV;
  final double? marginH;
  const CustomButton(
      {super.key,
      required this.text,
      this.color = const Color(0xff82bc02),
      this.marginV,
      this.marginH});

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
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
          ),
          onPressed: () {},
          child: SizedBox(
            height: 53,
            child: Center(
              child: Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(color: Colors.white),
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          )),
    );
  }
}
