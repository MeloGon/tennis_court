import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final Color? color;
  late final TextStyle? Function(BuildContext context)? getStyle;

  StyledText.headlineLarge(this.text,
      {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .headlineLarge
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  StyledText.headlineMedium(this.text,
      {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  StyledText.headlineSmall(this.text,
      {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .headlineSmall
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  StyledText.bodyLarge(this.text, {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  StyledText.bodyMedium(this.text, {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  StyledText.bodySmall(this.text, {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  StyledText.labelLarge(this.text, {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .labelLarge
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  StyledText.labelMedium(this.text, {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .labelMedium
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  StyledText.labelSmall(this.text, {this.fontWeight, this.color, super.key}) {
    getStyle = (context) {
      return Theme.of(context)
          .textTheme
          .labelSmall
          ?.copyWith(fontWeight: fontWeight, color: color);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: getStyle?.call(context));
  }
}
