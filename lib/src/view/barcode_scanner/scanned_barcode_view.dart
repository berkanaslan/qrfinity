import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/widget/button/scanned_value_actions.dart';
import 'package:qrfinity/src/core/widget/qr/qr_view.dart';
import 'package:qrfinity/src/core/widget/scaffold/body_wrapper.dart';
import 'package:qrfinity/src/core/widget/text/scanned_value.dart';

class ScannedBarcodeView extends StatelessWidget {
  final String scannedValue;

  const ScannedBarcodeView({Key? key, required this.scannedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWrapper(
      backgroundColor: AppColor.MIDNIGHT_BLUE,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(flex: 3, child: QRPreview(inputValue: scannedValue)),
            Expanded(child: ScannedValue(scannedValue: scannedValue)),
            Expanded(child: ScannedValueActions(scannedValue: scannedValue)),
          ],
        ),
      ),
    );
  }
}
