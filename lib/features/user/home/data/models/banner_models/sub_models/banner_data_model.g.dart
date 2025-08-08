// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerDataModel _$BannerDataModelFromJson(Map<String, dynamic> json) =>
    BannerDataModel(
      (json['products'] as List<dynamic>)
          .map(
              (e) => BannerProductDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerDataModelToJson(BannerDataModel instance) =>
    <String, dynamic>{
      'products': instance.banners,
    };
