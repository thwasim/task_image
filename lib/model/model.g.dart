// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ImagemodelAdapter extends TypeAdapter<Imagemodel> {
  @override
  final int typeId = 1;

  @override
  Imagemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Imagemodel(
      images: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Imagemodel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ImagemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
