// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsModel _$ProductsModelFromJson(Map<String, dynamic> json) =>
    ProductsModel(
      data: json['data'] == null
          ? null
          : ProductModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductsModelToJson(ProductsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      products: (json['products'] as List<dynamic>)
          .map((e) => ProductDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'products': instance.products,
    };

ProductDataModel _$ProductDataModelFromJson(Map<String, dynamic> json) =>
    ProductDataModel(
      price: (json['price'] as num?)?.toInt(),
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] == null
          ? null
          : ProductCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDataModelToJson(ProductDataModel instance) =>
    <String, dynamic>{
      'price': instance.price,
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'category': instance.category,
    };

ProductCategoryModel _$ProductCategoryModelFromJson(
        Map<String, dynamic> json) =>
    ProductCategoryModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$ProductCategoryModelToJson(
        ProductCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
