import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qrfinity/src/core/extension/context_extension.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/theme/app_icon.dart';
import 'package:qrfinity/src/core/widget/scaffold/body_wrapper.dart';
import 'package:qrfinity/src/core/widget/scanner/scanner.dart';
import 'package:qrfinity/src/view/home/scanned_barcode_view.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  late final MobileScannerController scannerController;
  String? scannedValue;

  @override
  void initState() {
    super.initState();
    scannerController = MobileScannerController();
  }

  @override
  Widget build(BuildContext context) {
    return BodyWrapper(
      backgroundColor: AppColor.MIDNIGHT_BLUE,
      body: _buildBody(),
    );
  }

  Center _buildBody() {
    return Center(
      child: Column(
        children: [
          _buildScanner(),
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  enableDrag: true,
                  builder: (context) {
                    return Column(
                      children: const [],
                    );
                  },
                );
              },
              icon: AppIcon.SCANNER),
        ],
      ),
    );
  }

  Scanner _buildScanner() {
    return Scanner(
      height: context.height * 0.5,
      width: context.height * 0.5,
      scannerController: scannerController,
      onDetect: _onDetect,
    );
  }

  Future<void> _onDetect(Barcode barcode, MobileScannerArguments? args) async {
    scannerController.stop();

    if (barcode.rawValue == null) {
      return;
    }

    if (scannedValue == barcode.rawValue) {
      return;
    }

    scannedValue = barcode.rawValue;
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScannedBarcodeView(scannedValue: scannedValue!)));

    scannerController.start();
  }
}
