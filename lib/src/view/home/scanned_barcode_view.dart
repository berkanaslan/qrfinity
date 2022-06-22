import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/extension/context_extension.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/theme/app_icon.dart';
import 'package:qrfinity/src/core/widget/button/circular_button.dart';
import 'package:qrfinity/src/core/widget/container/opaque_container.dart';
import 'package:qrfinity/src/core/widget/icon_button/copy_clipboard_button.dart';
import 'package:qrfinity/src/core/widget/qr/qr_view.dart';
import 'package:qrfinity/src/core/widget/scaffold/body_wrapper.dart';
import 'package:qrfinity/src/core/widget/text/helper_text.dart';

class ScannedBarcodeView extends StatelessWidget {
  final String scannedValue;

  const ScannedBarcodeView({Key? key, required this.scannedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWrapper(
      backgroundColor: AppColor.MIDNIGHT_BLUE,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              QRPreview(
                  height: context.height * 0.50, inputValue: scannedValue),
              _buildScannedValueContainer(context),
              CopyClipboardButton(scannedValue),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildScannedValueContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: HelperText(scannedValue, bold: true, fontSize: 16),
    );
  }
}
