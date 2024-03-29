import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';

class HelperText extends StatelessWidget {
  final String text;
  final bool bold;
  final double? fontSize;

  const HelperText(
    this.text, {
    Key? key,
    this.bold = false,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColor.WHITE,
        fontWeight: bold ? FontWeight.bold : FontWeight.normal,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
