// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponceModel _$AddProductResponceModelFromJson(
        Map<String, dynamic> json) =>
    AddProductResponceModel(
      data: json['data'] == null
          ? null
          : AddProduct.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddProductResponceModelToJson(
        AddProductResponceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

AddProduct _$AddProductFromJson(Map<String, dynamic> json) => AddProduct(
      title: json['title'] as String?,
    );

Map<String, dynamic> _$AddProductToJson(AddProduct instance) =>
    <String, dynamic>{
      'title': instance.title,
    };
