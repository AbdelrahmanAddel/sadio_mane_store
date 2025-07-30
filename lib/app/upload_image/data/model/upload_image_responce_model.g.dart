// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadImageResponceModel _$UploadImageResponceModelFromJson(
        Map<String, dynamic> json) =>
    UploadImageResponceModel(
      originalname: json['originalname'] as String?,
      filename: json['filename'] as String?,
      location: json['location'] as String?,
    );

Map<String, dynamic> _$UploadImageResponceModelToJson(
        UploadImageResponceModel instance) =>
    <String, dynamic>{
      'originalname': instance.originalname,
      'filename': instance.filename,
      'location': instance.location,
    };
