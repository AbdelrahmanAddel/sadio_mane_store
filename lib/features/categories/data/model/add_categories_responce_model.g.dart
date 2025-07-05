// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_categories_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCategoryResponceModel _$AddCategoryResponceModelFromJson(
  Map<String, dynamic> json,
) => AddCategoryResponceModel(
  data:
      json['data'] == null
          ? null
          : AddCategoriesModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddCategoryResponceModelToJson(
  AddCategoryResponceModel instance,
) => <String, dynamic>{'data': instance.data};

AddCategoriesModel _$AddCategoriesModelFromJson(Map<String, dynamic> json) =>
    AddCategoriesModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$AddCategoriesModelToJson(AddCategoriesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
    };
