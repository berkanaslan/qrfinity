import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/extension/context_extension.dart';
import 'package:qrfinity/src/core/widget/text/helper_text.dart';

class CircularButton extends StatelessWidget {
  final double? width;
  final Widget icon;
  final String text;
  final Color color;
  final void Function() onPressed;

  const CircularButton({
    Key? key,
    this.width,
    required this.icon,
    required this.text,
    required this.color,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? context.height * 0.15,
      height: 56,
      child: ElevatedButton(
        style: _getButtonStyle(),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            icon,
            HelperText(text, bold: true),
          ],
        ),
      ),
    );
  }

  ButtonStyle _getButtonStyle() {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }
}
