import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';

class QRPreview extends StatelessWidget {
  final double? height;
  final String inputValue;
  final int? version;
  final Color? foregroundColor;
  final Color backgroundColor;

  const QRPreview({
    Key? key,
    this.height,
    required this.inputValue,
    this.version = QrVersions.auto,
    this.foregroundColor,
    this.backgroundColor = AppColor.WHITE,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QrImage(
      size: height,
      version: version!,
      data: inputValue,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      padding: EdgeInsets.zero,
    );
  }

  static QrValidationResult generateQRValidationResult(String data) {
    return QrValidator.validate(
      data: data,
      version: QrVersions.auto,
      errorCorrectionLevel: QrErrorCorrectLevel.L,
    );
  }
}
