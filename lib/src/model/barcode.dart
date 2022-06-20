import 'package:hive_flutter/hive_flutter.dart';
import 'package:qrfinity/src/model/barcode_type.dart';
import 'package:qrfinity/src/model/storable_entity.dart';

part 'barcode.g.dart';

@HiveType(typeId: 1)
class Barcode extends StorableEntity {
  @HiveField(0, defaultValue: BarcodeType.qr)
  BarcodeType type;

  @HiveField(1)
  String inputValue;

  @HiveField(2)
  String? name;

  @HiveField(3)
  String? description;

  Barcode({this.type = BarcodeType.qr, required this.inputValue, this.name, this.description});

  @override
  String toString() {
    return 'Barcode{type: $type, inputValue: $inputValue, name: $name, description: $description}';
  }
}
