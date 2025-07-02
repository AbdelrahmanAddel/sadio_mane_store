// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_categories_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCategoriesResponceModel _$GetCategoriesResponceModelFromJson(
  Map<String, dynamic> json,
) => GetCategoriesResponceModel(
  json['data'] == null
      ? null
      : CategoriesModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetCategoriesResponceModelToJson(
  GetCategoriesResponceModel instance,
) => <String, dynamic>{'data': instance.data};

CategoriesModel _$CategoriesModelFromJson(Map<String, dynamic> json) =>
    CategoriesModel(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map(
                (e) => CategoriesDataModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$CategoriesModelToJson(CategoriesModel instance) =>
    <String, dynamic>{'categories': instance.categories};

CategoriesDataModel _$CategoriesDataModelFromJson(Map<String, dynamic> json) =>
    CategoriesDataModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoriesDataModelToJson(
  CategoriesDataModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
};
