// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometrics_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BiometricsModelAdapter extends TypeAdapter<BiometricsModel> {
  @override
  final int typeId = 1;

  @override
  BiometricsModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BiometricsModel(
      biometrics: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, BiometricsModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.biometrics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BiometricsModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
