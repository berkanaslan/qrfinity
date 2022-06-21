import 'package:flutter/material.dart';

class CircularBorderRadius extends StatelessWidget {
  final Widget child;

  const CircularBorderRadius({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: child,
    );
  }
}
