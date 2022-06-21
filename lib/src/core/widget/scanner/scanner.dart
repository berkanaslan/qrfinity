import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrfinity/src/core/widget/cliprrect/app_border_radius.dart';

class Scanner extends StatelessWidget {
  final double height;
  final double width;
  final MobileScannerController scannerController;
  final Function(Barcode barcode, MobileScannerArguments? args) onDetect;

  const Scanner({
    Key? key,
    required this.height,
    required this.width,
    required this.scannerController,
    required this.onDetect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScannerWrapper(
      width: width,
      height: height,
      scanner: MobileScanner(
        controller: scannerController,
        onDetect: onDetect,
        allowDuplicates: false,
      ),
    );
  }
}

class ScannerWrapper extends StatelessWidget {
  final double height;
  final double width;
  final MobileScanner scanner;

  const ScannerWrapper({
    Key? key,
    required this.height,
    required this.width,
    required this.scanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CircularBorderRadius(child: scanner),
    );
  }
}
