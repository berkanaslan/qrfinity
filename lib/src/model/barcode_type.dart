import 'package:hive_flutter/hive_flutter.dart';

part 'barcode_type.g.dart';

@HiveType(typeId: 0)
enum BarcodeType {
  @HiveField(0)
  qr

  // TODO: Others...
}
