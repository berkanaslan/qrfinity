import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final void Function() onPressed;
  final double? iconSize;
  final Color? color;

  const AppIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.iconSize,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: color,
      iconSize: iconSize,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onPressed: onPressed,
    );
  }
}
