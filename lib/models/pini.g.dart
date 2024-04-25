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
      case 3:
        return Pini.glare;
      case 4:
        return Pini.embarrass;
      case 5:
        return Pini.fun;
      case 6:
        return Pini.love;
      case 7:
        return Pini.melt;
      case 8:
        return Pini.sad;
      case 9:
        return Pini.tired;
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
      case Pini.glare:
        writer.writeByte(3);
        break;
      case Pini.embarrass:
        writer.writeByte(4);
        break;
      case Pini.fun:
        writer.writeByte(5);
        break;
      case Pini.love:
        writer.writeByte(6);
        break;
      case Pini.melt:
        writer.writeByte(7);
        break;
      case Pini.sad:
        writer.writeByte(8);
        break;
      case Pini.tired:
        writer.writeByte(9);
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
