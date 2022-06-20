import 'package:hive_flutter/hive_flutter.dart';
import 'package:qrfinity/src/database/database.dart';
import 'package:qrfinity/src/model/barcode.dart';
import 'package:qrfinity/src/model/barcode_type.dart';
import 'package:qrfinity/src/repository/barcode_repository.dart';

class HiveDatabase implements Database {
  @override
  Future<void> init() async {
    await Hive.initFlutter();
    await register();
    await open();
  }

  @override
  Future<void> register() async {
    Hive.registerAdapter(BarcodeTypeAdapter());
    Hive.registerAdapter(BarcodeAdapter());
  }

  @override
  Future<void> open() async {
    await Hive.openBox<Barcode>(BarcodeRepository.NAME);
  }
}
