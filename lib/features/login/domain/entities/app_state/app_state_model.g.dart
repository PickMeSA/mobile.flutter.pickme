// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppStateModelAdapter extends TypeAdapter<AppStateModel> {
  @override
  final int typeId = 2;

  @override
  AppStateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppStateModel(
      loggedIn: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, AppStateModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(1)
      ..write(obj.loggedIn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppStateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
