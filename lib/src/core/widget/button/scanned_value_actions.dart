import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/widget/button/copy_clipboard_button.dart';
import 'package:qrfinity/src/core/widget/button/share_button.dart';

class ScannedValueActions extends StatelessWidget {
  final String scannedValue;

  const ScannedValueActions({Key? key, required this.scannedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ShareButton(scannedValue),
        CopyClipboardButton(scannedValue),
      ],
    );
  }
}
