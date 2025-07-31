import 'package:json_annotation/json_annotation.dart';
part 'delete_category_responce_model.g.dart';

@JsonSerializable()
class DeleteCategoryResponceModel {
  DeleteCategoryResponceModel({required this.data});
  factory DeleteCategoryResponceModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteCategoryResponceModelFromJson(json);
  final Data data;
}

@JsonSerializable()
class Data {
  Data({required this.deleteCategory});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  final bool deleteCategory;
}
