import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrfinity/src/core/get_it.dart';
import 'package:qrfinity/src/database/hive_database.dart';
import 'package:qrfinity/src/view/home/home_view.dart';

void main() async {
  setupLocator();
  await locator<HiveDatabase>().init();

  runApp(const QRFinity());
}

class QRFinity extends StatelessWidget {
  const QRFinity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "QRFinity",
      home: const HomeView(),
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(textTheme: GoogleFonts.interTextTheme()),
      // TODO: ....
    );
  }
}
