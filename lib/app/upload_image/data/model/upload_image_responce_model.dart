import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_image_responce_model.g.dart';

@JsonSerializable()
class UploadImageResponceModel {
  UploadImageResponceModel({this.originalname, this.filename, this.location});
  factory UploadImageResponceModel.fromJson(Map<String, dynamic> json) =>
      _$UploadImageResponceModelFromJson(json);
  String? originalname;
  String? filename;
  String? location;
}
