// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_categories_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardCategoriesModel _$DashboardCategoriesModelFromJson(
  Map<String, dynamic> json,
) => DashboardCategoriesModel(
  data:
      json['data'] == null
          ? null
          : CategoryModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DashboardCategoriesModelToJson(
  DashboardCategoriesModel instance,
) => <String, dynamic>{'data': instance.data};

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      categories:
          (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryID.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{'categories': instance.categories};

CategoryID _$CategoryIDFromJson(Map<String, dynamic> json) =>
    CategoryID(id: json['id'] as String?);

Map<String, dynamic> _$CategoryIDToJson(CategoryID instance) =>
    <String, dynamic>{'id': instance.id};
