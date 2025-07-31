// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_category_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteCategoryResponceModel _$DeleteCategoryResponceModelFromJson(
        Map<String, dynamic> json) =>
    DeleteCategoryResponceModel(
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DeleteCategoryResponceModelToJson(
        DeleteCategoryResponceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      deleteCategory: json['deleteCategory'] as bool,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'deleteCategory': instance.deleteCategory,
    };
