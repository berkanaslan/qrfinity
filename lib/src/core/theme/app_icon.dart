import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';

class AppIcon {
  static const Icon SCANNER = Icon(Ionicons.barcode_outline);
  static const Icon QR = Icon(Ionicons.qr_code_outline);
  static const Icon CAMERA_FACING = Icon(Ionicons.camera_reverse_outline);
  static const Icon TORCH_ON = Icon(Ionicons.flash_outline, color: AppColor.YELLOW);
  static const Icon TORCH_OFF = Icon(Ionicons.flash_off_outline);
}
