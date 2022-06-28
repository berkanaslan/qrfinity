import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/theme/app_color.dart';
import 'package:qrfinity/src/core/widget/scaffold/body_wrapper.dart';

class BarcodeGeneratorPage extends StatefulWidget {
  const BarcodeGeneratorPage({Key? key}) : super(key: key);

  @override
  State<BarcodeGeneratorPage> createState() => _BarcodeGeneratorPageState();
}

class _BarcodeGeneratorPageState extends State<BarcodeGeneratorPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BodyWrapper(
      backgroundColor: AppColor.ORANGE,
      body: Center(
        child: Column(
          children: const [],
        ),
      ),
    );
  }
}
