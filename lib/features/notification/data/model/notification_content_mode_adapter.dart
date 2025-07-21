import 'package:hive/hive.dart';
import 'package:sadio_mane_store/features/notification/data/model/notification_content_model.dart';

class NotificationContentModeAdapter
    extends TypeAdapter<NotificationContentModel> {
  @override
  NotificationContentModel read(BinaryReader reader) {
    return NotificationContentModel(
      title: reader.readString(),
      body: reader.readString(),
      createdAt: reader.readString(),
      productId: reader.readInt(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, NotificationContentModel notification) {
    writer
      ..writeString(notification.title)
      ..writeString(notification.body)
      ..writeString(notification.createdAt)
      ..writeInt(notification.productId);
  }
}
