// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cartmodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartmodelAdapter extends TypeAdapter<Cartmodel> {
  @override
  final int typeId = 1;

  @override
  Cartmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cartmodel(
      title: fields[0] as String,
      description: fields[1] as String,
      image: fields[3] as String,
      price: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, Cartmodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
