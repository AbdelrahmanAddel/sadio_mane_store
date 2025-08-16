// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_product_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerProductDataModel _$BannerProductDataModelFromJson(
        Map<String, dynamic> json) =>
    BannerProductDataModel(
      title: json['title'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$BannerProductDataModelToJson(
        BannerProductDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'images': instance.images,
    };
