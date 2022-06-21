import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrfinity/src/core/extension/context_extension.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/widget/scaffold/body_wrapper.dart';

class ScannedBarcodeView extends StatelessWidget {
  final String scannedValue;

  const ScannedBarcodeView({Key? key, required this.scannedValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWrapper(
      backgroundColor: AppColor.MIDNIGHT_BLUE,
      body: Column(
        children: [
          _buildQRArea(context),
        ],
      ),
    );
  }

  Widget _buildQRArea(BuildContext context) {
    return QRPreview(
      height: context.height * 0.5,
      width: context.height * 0.5,
      inputValue: scannedValue,
    );
  }
}

class QRPreview extends StatelessWidget {
  final double height;
  final double width;
  final String inputValue;

  const QRPreview({
    Key? key,
    required this.height,
    required this.width,
    required this.inputValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: QrImage(
        data: inputValue,
        foregroundColor: AppColor.WHITE,
        backgroundColor: AppColor.MIDNIGHT_BLUE,
      ),
    );
  }
}
