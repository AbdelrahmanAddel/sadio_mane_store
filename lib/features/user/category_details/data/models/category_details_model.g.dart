// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesDetailsResponseModel _$GetCategoriesDetailsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesDetailsResponseModel(
      json['data'] == null
          ? null
          : CategoriesDetailsModel.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCategoriesDetailsResponseModelToJson(
        GetCategoriesDetailsResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

CategoriesDetailsModel _$CategoriesDetailsModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesDetailsModel(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) =>
              CategoriesDetailsDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoriesDetailsModelToJson(
        CategoriesDetailsModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

CategoriesDetailsDataModel _$CategoriesDetailsDataModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesDetailsDataModel(
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoriesDetailsDataModelToJson(
        CategoriesDetailsDataModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
    };
