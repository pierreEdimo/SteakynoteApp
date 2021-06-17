// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksAdapter extends TypeAdapter<Books> {
  @override
  final int typeId = 0;

  @override
  Books read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Books(
      description: fields[1] as String?,
      title: fields[0] as String?,
      creationDate: fields[2] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, Books obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.creationDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
