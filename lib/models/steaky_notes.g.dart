// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'steaky_notes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SteakyNoteAdapter extends TypeAdapter<SteakyNote> {
  @override
  final int typeId = 2;

  @override
  SteakyNote read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SteakyNote(
      content: fields[0] as String?,
      creationDate: fields[1] as DateTime?,
      editedDate: fields[2] as DateTime?,
      booKey: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, SteakyNote obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.content)
      ..writeByte(1)
      ..write(obj.creationDate)
      ..writeByte(2)
      ..write(obj.editedDate)
      ..writeByte(3)
      ..write(obj.booKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SteakyNoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
