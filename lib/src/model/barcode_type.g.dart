// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode_type.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BarcodeTypeAdapter extends TypeAdapter<BarcodeType> {
  @override
  final int typeId = 0;

  @override
  BarcodeType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return BarcodeType.qr;
      default:
        return BarcodeType.qr;
    }
  }

  @override
  void write(BinaryWriter writer, BarcodeType obj) {
    switch (obj) {
      case BarcodeType.qr:
        writer.writeByte(0);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BarcodeTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
