import 'package:json_annotation/json_annotation.dart';

part 'category_details_model.g.dart';

@JsonSerializable()
class GetCategoriesDetailsResponseModel {
  GetCategoriesDetailsResponseModel(this.data);
  factory GetCategoriesDetailsResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => _$GetCategoriesDetailsResponseModelFromJson(json);

  final CategoriesDetailsModel? data;
}

@JsonSerializable()
class CategoriesDetailsModel {
  CategoriesDetailsModel({this.products});
  factory CategoriesDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDetailsModelFromJson(json);
  List<CategoriesDetailsDataModel>? products;
}

@JsonSerializable()
class CategoriesDetailsDataModel {
  CategoriesDetailsDataModel({
    required this.title,
    required this.price,
    required this.image,
  });
  factory CategoriesDetailsDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesDetailsDataModelFromJson(json);

  final String? title;
  final int? price;
  final String? image;
}
