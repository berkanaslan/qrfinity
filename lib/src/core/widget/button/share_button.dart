// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrfinity/src/core/extension/qr_code_extension.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/theme/app_icon.dart';
import 'package:qrfinity/src/core/widget/button/circular_button.dart';

class ShareButton extends StatelessWidget {
  final String value;

  const ShareButton(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      icon: AppIcon.SHARE,
      text: "Share", // TODO: Tranlate
      color: AppColor.MEDIUM_TURQUISE,
      onPressed: _share,
    );
  }

  Future<void> _share() async {
    final QrValidationResult qrValidationResult = value.toQrValidationResult;
    await qrValidationResult.shareQR(value);
  }
}
