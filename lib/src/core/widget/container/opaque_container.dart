import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/widget/cliprrect/app_border_radius.dart';

class OpaqueContainer extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;

  const OpaqueContainer({Key? key, this.height, this.width, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularBorderRadius(
      child: Container(
        height: height,
        width: width,
        color: AppColor.WHITE.withOpacity(0.20),
        child: child,
      ),
    );
  }
}
