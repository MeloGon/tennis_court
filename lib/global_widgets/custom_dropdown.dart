import 'package:flutter/material.dart';
import 'package:tennis_court/core/extensions/extensions.dart';

class CustomDropdown extends StatelessWidget {
  final double? width;
  const CustomDropdown({super.key, this.width = double.infinity});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      width: width,
      height: 62,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: .2),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.max,
        children: [
          Text('Fecha'),
          Column(
            children: [
              8.h,
              DropdownButtonFormField<String>(
                  padding: EdgeInsets.zero,
                  icon: Icon(Icons.keyboard_arrow_down_outlined),
                  decoration: const InputDecoration(border: InputBorder.none),
                  items: [DropdownMenuItem(child: Text('data'))],
                  onChanged: (value) {}),
            ],
          ),
        ],
      ),
    );
  }
}
