// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_category_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCategoryResponceModel _$UpdateCategoryResponceModelFromJson(
        Map<String, dynamic> json) =>
    UpdateCategoryResponceModel(
      data: json['data'] == null
          ? null
          : DataCategortModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateCategoryResponceModelToJson(
        UpdateCategoryResponceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataCategortModel _$DataCategortModelFromJson(Map<String, dynamic> json) =>
    DataCategortModel(
      updateCategory: json['updateCategory'] == null
          ? null
          : UpdateCategoryModel.fromJson(
              json['updateCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataCategortModelToJson(DataCategortModel instance) =>
    <String, dynamic>{
      'updateCategory': instance.updateCategory,
    };

UpdateCategoryModel _$UpdateCategoryModelFromJson(Map<String, dynamic> json) =>
    UpdateCategoryModel(
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UpdateCategoryModelToJson(
        UpdateCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
