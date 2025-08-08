import 'package:json_annotation/json_annotation.dart';

part 'get_product_by_category_id_model.g.dart';

@JsonSerializable()
class GetCategoriesByIdResponseModel {
  GetCategoriesByIdResponseModel(this.data);
  factory GetCategoriesByIdResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCategoriesByIdResponseModelFromJson(json);

  final ProductModels? data;
}

@JsonSerializable()
class ProductModels {
  ProductModels({this.products});
  factory ProductModels.fromJson(Map<String, dynamic> json) =>
      _$ProductModelsFromJson(json);
  List<ProductsData>? products;
}

@JsonSerializable()
class ProductsData {
  ProductsData({
    required this.description,
    required this.title,
    required this.price,
    required this.images,
  });
  factory ProductsData.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataFromJson(json);

  final String? title;
  final int? price;
  final List<String>? images;
  final String? description;
}
