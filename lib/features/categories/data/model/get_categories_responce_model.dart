import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_categories_responce_model.g.dart';

@JsonSerializable()
class GetCategoriesResponceModel {
  GetCategoriesResponceModel(this.data);
  factory GetCategoriesResponceModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesResponceModelFromJson(json);

  final CategoriesModel? data;
}

@JsonSerializable()
class CategoriesModel {
  CategoriesModel({this.categories});
  factory CategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesModelFromJson(json);
  List<CategoriesDataModel>? categories;
}

@JsonSerializable()
class CategoriesDataModel {
  CategoriesDataModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDataModelFromJson(json);

  final String? id;
  final String? name;
  final String? image;
}
