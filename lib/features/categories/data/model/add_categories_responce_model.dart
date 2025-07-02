import 'package:json_annotation/json_annotation.dart';
part 'add_categories_responce_model.g.dart';
@JsonSerializable()
class AddCategoriesResponceModel {
  AddCategoriesResponceModel({required this.data});
  factory AddCategoriesResponceModel.fromJson(Map<String, dynamic> json) =>
      _$AddCategoriesResponceModelFromJson(json);

  final AddCategoriesModel? data;
}

@JsonSerializable()
class AddCategoriesModel {
  AddCategoriesModel({
    required this.id,
    required this.name,
    required this.image,
  });
  factory AddCategoriesModel.fromJson(Map<String, dynamic> json) =>
      _$AddCategoriesModelFromJson(json);

  final String? id;
  final String? name;
  final String? image;
}
