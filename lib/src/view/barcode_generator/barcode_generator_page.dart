import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qrfinity/src/core/get_it.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/widget/cliprrect/app_border_radius.dart';
import 'package:qrfinity/src/core/widget/qr/qr_view.dart';
import 'package:qrfinity/src/core/widget/scaffold/body_wrapper.dart';
import 'package:qrfinity/src/model/barcode.dart' as local_barcode;
import 'package:qrfinity/src/repository/barcode_repository.dart';

class BarcodeGeneratorPage extends StatefulWidget {
  const BarcodeGeneratorPage({Key? key}) : super(key: key);

  @override
  State<BarcodeGeneratorPage> createState() => _BarcodeGeneratorPageState();
}

class _BarcodeGeneratorPageState extends State<BarcodeGeneratorPage> {
  late final BarcodeRepository barcodeRepository;
  final List<local_barcode.Barcode> barcodes = [];

  @override
  void initState() {
    super.initState();
    barcodeRepository = locator<BarcodeRepository>();
  }

  @override
  Widget build(BuildContext context) {
    return BodyWrapper(
      backgroundColor: AppColor.ORANGE,
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: barcodeRepository.getBox().listenable(),
          builder: (context, Box<local_barcode.Barcode> box, widget) {
            return ListView(children: box.values.map((e) => buildCard(e)).toList().reversed.toList());
          },
        ),
      ),
    );
  }

  Widget buildCard(local_barcode.Barcode e) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        style: ListTileStyle.drawer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        leading: Padding(padding: const EdgeInsets.all(8.0), child: QRPreview(inputValue: e.inputValue)),
        title: Text(e.inputValue),
        subtitle: Text("${e.addedAt}"),
        tileColor: AppColor.WHITE.withOpacity(0.5),
      ),
    );
  }
}
