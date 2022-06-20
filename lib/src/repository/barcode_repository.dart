import 'package:hive_flutter/hive_flutter.dart';
import 'package:qrfinity/src/model/barcode.dart';
import 'package:qrfinity/src/repository/repository.dart';

class BarcodeRepository implements Repository<Barcode> {
  static const String NAME = "barcode";

  @override
  List<Barcode> get() {
    return Hive.box<Barcode>(NAME).values.toList();
  }

  @override
  Future<void> add(Barcode barcode) async {
    await Hive.box<Barcode>(NAME).add(barcode);
  }

  @override
  Future<void> addAll(List<Barcode> barcodes) async {
    await Hive.box<Barcode>(NAME).addAll(barcodes);
  }

  @override
  Future<void> save(Barcode barcode) async {
    await barcode.save();
  }

  @override
  Future<void> delete(Barcode barcode) async {
    await barcode.delete();
  }
}
