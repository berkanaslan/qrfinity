import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrfinity/src/core/extension/context_extension.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/theme/app_icon.dart';
import 'package:qrfinity/src/core/widget/cliprrect/app_border_radius.dart';
import 'package:qrfinity/src/core/widget/container/opaque_container.dart';
import 'package:qrfinity/src/core/widget/icon_button/app_icon_button.dart';

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
      scanner: MobileScanner(controller: scannerController, onDetect: onDetect, allowDuplicates: false),
    );
  }
}

class CameraManager extends StatelessWidget {
  final MobileScannerController scannerController;

  const CameraManager({Key? key, required this.scannerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpaqueContainer(
      width: context.height * 0.5,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CameraFacingManager(scannerController: scannerController),
          TorchManager(scannerController: scannerController),
        ],
      ),
    );
  }
}

class TorchManager extends StatelessWidget {
  final MobileScannerController scannerController;

  const TorchManager({Key? key, required this.scannerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      color: AppColor.WHITE,
      icon: ValueListenableBuilder(
        valueListenable: scannerController.torchState,
        builder: (context, state, child) {
          switch (state as TorchState) {
            case TorchState.off:
              return AppIcon.TORCH_OFF;
            case TorchState.on:
              return AppIcon.TORCH_ON;
          }
        },
      ),
      onPressed: () => scannerController.toggleTorch(),
    );
  }
}

class CameraFacingManager extends StatelessWidget {
  final MobileScannerController scannerController;

  const CameraFacingManager({Key? key, required this.scannerController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      color: AppColor.WHITE,
      icon: AppIcon.CAMERA_FACING,
      onPressed: () => scannerController.switchCamera(),
    );
  }
}

class ScannerWrapper extends StatelessWidget {
  final double height;
  final double width;
  final Widget scanner;

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
