import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_categories_model.g.dart';

@JsonSerializable()
class DashboardCategoriesModel {
  DashboardCategoriesModel({this.data});

  factory DashboardCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardCategoriesModelFromJson(json);

  final CategoryModel? data;
}

@JsonSerializable()
class CategoryModel {
  CategoryModel({this.categories});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  final List<CategoryID>? categories;
}

@JsonSerializable()
class CategoryID {
  CategoryID({this.id});

  factory CategoryID.fromJson(Map<String, dynamic> json) =>
      _$CategoryIDFromJson(json);

  final String? id;
}
