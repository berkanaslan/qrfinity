import 'package:flutter/material.dart';
import 'package:qrfinity/src/core/get_it.dart';
import 'package:qrfinity/src/database/hive_database.dart';

void main() async {
  setupLocator();
  await locator<HiveDatabase>().init();

  runApp(const QRFinity());
}

class QRFinity extends StatelessWidget {
  const QRFinity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "QRFinity",
      // TODO: ....
    );
  }
}
