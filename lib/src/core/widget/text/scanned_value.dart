import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/widget/text/helper_text.dart';

class ScannedValue extends StatelessWidget {
  final String scannedValue;

  const ScannedValue({Key? key, required this.scannedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: HelperText(scannedValue, bold: true, fontSize: 16),
    );
  }
}
