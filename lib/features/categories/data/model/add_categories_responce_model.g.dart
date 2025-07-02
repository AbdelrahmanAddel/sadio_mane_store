// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_categories_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCategoriesResponceModel _$AddCategoriesResponceModelFromJson(
  Map<String, dynamic> json,
) => AddCategoriesResponceModel(
  data:
      json['data'] == null
          ? null
          : AddCategoriesModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AddCategoriesResponceModelToJson(
  AddCategoriesResponceModel instance,
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
