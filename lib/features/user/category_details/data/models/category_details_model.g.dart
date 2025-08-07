// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_product_by_category_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesByIdResponseModel _$GetCategoriesByIdResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCategoriesByIdResponseModel(
      json['data'] == null
          ? null
          : ProductModels.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetCategoriesByIdResponseModelToJson(
        GetCategoriesByIdResponseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductModels _$ProductModelsFromJson(Map<String, dynamic> json) =>
    ProductModels(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelsToJson(ProductModels instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

ProductsData _$ProductsDataFromJson(Map<String, dynamic> json) => ProductsData(
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ProductsDataToJson(ProductsData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'price': instance.price,
      'images': instance.images,
    };
