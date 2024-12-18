import 'package:flutter/material.dart';

extension SpaceExtension on int {
  Widget get w => SizedBox(
        width: toDouble(),
      );

  Widget get h => SizedBox(
        height: toDouble(),
      );
}
