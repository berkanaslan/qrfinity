import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/model/path.dart';
import 'package:share_plus/share_plus.dart';

extension StringExtension on String {
  QrValidationResult get toQrValidationResult =>
      QrValidator.validate(data: this, version: QrVersions.auto, errorCorrectionLevel: QrErrorCorrectLevel.L);
}

extension QRPainterExtension on QrPainter {
  Future<void> _save(String path) async {
    final ByteData? data = await toImageData(2048, format: ImageByteFormat.png);
    final buffer = data!.buffer;
    await File(path).writeAsBytes(buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }
}

extension QRValidationExtension on QrValidationResult {
  Future<void> _saveAsImage(String path, {Color? foregroundColor, Color? backgroundColor}) async {
    final QrPainter qrPainter = QrPainter.withQr(
      qr: qrCode!,
      color: foregroundColor ?? AppColor.BLACK,
      emptyColor: backgroundColor,
      gapless: true,
    );

    await qrPainter._save(path);
  }

  Future<void> shareQR(String value, {Color? foregroundColor, Color? backgroundColor}) async {
    final String path = await DevicePath().getStoragePNGPath();
    await _saveAsImage(path, backgroundColor: backgroundColor, foregroundColor: foregroundColor);
    await Share.shareFiles([path], mimeTypes: ["image/png"], subject: "QR Code", text: value); // TODO: Translate
  }
}
