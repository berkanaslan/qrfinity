import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/extension/context_extension.dart';
import 'package:qrfinity/src/core/widget/container/opaque_container.dart';
import 'package:qrfinity/src/core/widget/text/helper_text.dart';

// TODO: Translate
class ScannerHelperText extends StatelessWidget {
  const ScannerHelperText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpaqueContainer(
      width: context.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            HelperText("Scan QR Code", bold: true),
            HelperText("When the QR code is scanned\nit's stored in the device.\nYou can access it again whenever you want."),
          ],
        ),
      ),
    );
  }
}
