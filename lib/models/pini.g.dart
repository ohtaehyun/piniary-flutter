// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pini.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PiniAdapter extends TypeAdapter<Pini> {
  @override
  final int typeId = 2;

  @override
  Pini read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Pini.none;
      case 1:
        return Pini.app;
      case 2:
        return Pini.happy;
      default:
        return Pini.none;
    }
  }

  @override
  void write(BinaryWriter writer, Pini obj) {
    switch (obj) {
      case Pini.none:
        writer.writeByte(0);
        break;
      case Pini.app:
        writer.writeByte(1);
        break;
      case Pini.happy:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PiniAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
