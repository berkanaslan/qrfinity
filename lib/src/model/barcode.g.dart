// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'barcode.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BarcodeAdapter extends TypeAdapter<Barcode> {
  @override
  final int typeId = 1;

  @override
  Barcode read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Barcode(
      type: fields[0] == null ? BarcodeType.qr : fields[0] as BarcodeType,
      inputValue: fields[1] as String,
      name: fields[2] as String?,
      description: fields[3] as String?,
      addedAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Barcode obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.inputValue)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.addedAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is BarcodeAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
