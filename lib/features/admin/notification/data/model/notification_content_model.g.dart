// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_content_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationContentModelAdapter
    extends TypeAdapter<NotificationContentModel> {
  @override
  final int typeId = 0;

  @override
  NotificationContentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NotificationContentModel(
      title: fields[0] as String?,
      body: fields[1] as String?,
      createdAt: fields[2] as String?,
      productId: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, NotificationContentModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.body)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.productId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationContentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
