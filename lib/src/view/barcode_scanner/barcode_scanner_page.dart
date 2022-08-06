import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qrfinity/src/core/extension/context_extension.dart';
import 'package:qrfinity/src/core/get_it.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/widget/container/scanner_helper_text.dart';
import 'package:qrfinity/src/core/widget/scaffold/body_wrapper.dart';
import 'package:qrfinity/src/core/widget/scanner/scanner.dart';
import 'package:qrfinity/src/repository/barcode_repository.dart';
import 'package:qrfinity/src/view/barcode_scanner/scanned_barcode_view.dart';
import 'package:qrfinity/src/model/barcode.dart' as local_barcode;

class BarcodeScannerPage extends StatefulWidget {
  final MobileScannerController scannerController;

  const BarcodeScannerPage({Key? key, required this.scannerController}) : super(key: key);

  @override
  State<BarcodeScannerPage> createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  late final MobileScannerController scannerController;
  late final BarcodeRepository barcodeRepository;

  String? scannedValue;

  @override
  void initState() {
    super.initState();
    scannerController = widget.scannerController;
    barcodeRepository = locator<BarcodeRepository>();
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
          Expanded(child: CameraManager(scannerController: scannerController)),
          const SizedBox(height: 24.0),
          Expanded(flex: 6, child: _buildScanner()),
          const SizedBox(height: 24.0),
          const Expanded(flex: 2, child: ScannerHelperText()),
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

    barcodeRepository.add(local_barcode.Barcode(
      inputValue: scannedValue!,
      addedAt: DateTime.now(),
    ));

    await Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return ScannedBarcodeView(scannedValue: scannedValue!);
    }));

    scannerController.start();
  }
}
