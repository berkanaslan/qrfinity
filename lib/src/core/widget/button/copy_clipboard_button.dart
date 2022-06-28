// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/theme/app_icon.dart';
import 'package:qrfinity/src/core/widget/button/circular_button.dart';
import 'package:qrfinity/src/core/widget/text/helper_text.dart';

class CopyClipboardButton extends StatelessWidget {
  final String value;

  const CopyClipboardButton(this.value, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularButton(
      icon: AppIcon.COPY_CLIPBOARD,
      text: "Copy", // Translate
      color: AppColor.ORANGE,
      onPressed: () => _copy(context),
    );
  }

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(ClipboardData(text: value));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: HelperText("Copied!"), // TODO: Translate
        backgroundColor: AppColor.GREEN,
        duration: Duration(milliseconds: 500),
      ),
    );
  }
}
