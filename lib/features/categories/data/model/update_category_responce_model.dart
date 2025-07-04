import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_category_responce_model.g.dart';

@JsonSerializable()
class UpdateCategoryResponceModel {
  UpdateCategoryResponceModel({required this.data});

  factory UpdateCategoryResponceModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryResponceModelFromJson(json);
  final DataCategortModel? data;
}

@JsonSerializable()
class DataCategortModel {
  DataCategortModel({required this.updateCategory});

  factory DataCategortModel.fromJson(Map<String, dynamic> json) =>
      _$DataCategortModelFromJson(json);
  final UpdateCategoryModel? updateCategory;
}

@JsonSerializable()
class UpdateCategoryModel {
  UpdateCategoryModel({required this.id});
  factory UpdateCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateCategoryModelFromJson(json);

  final int? id;
}
