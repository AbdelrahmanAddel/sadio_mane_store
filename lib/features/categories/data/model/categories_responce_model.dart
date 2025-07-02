import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_responce_model.g.dart';

@JsonSerializable()
class GetCategoriesResponceModel {
  GetCategoriesResponceModel(this.data);
  factory GetCategoriesResponceModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponceModelFromJson(json);

  final CategoriesModel? data;
}

@JsonSerializable()
class CategoriesModel {
  List<CategoriesDataModel>? categories;
  CategoriesModel({this.categories});
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
}

@JsonSerializable()
class CategoriesDataModel {
  CategoriesDataModel({
    required this.id,
    required this.name,
    required this.image,
  });

  final String? id;
  final String? name;
  final String? image;
  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataModelFromJson(json);
}
