// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piniary.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PiniaryAdapter extends TypeAdapter<Piniary> {
  @override
  final int typeId = 1;

  @override
  Piniary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Piniary(
      content: fields[2] as String,
      date: fields[0] as DateTime,
      pini: fields[1] as Pini,
    );
  }

  @override
  void write(BinaryWriter writer, Piniary obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.pini)
      ..writeByte(2)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PiniaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
