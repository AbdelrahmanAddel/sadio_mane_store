import 'package:freezed_annotation/freezed_annotation.dart';
part 'products_model.g.dart';

@JsonSerializable()
class ProductsModel {
  ProductsModel({required this.data});
  factory ProductsModel.fromJson(Map<String, dynamic> json) =>
      _$ProductsModelFromJson(json);

  final ProductModel? data;
}

@JsonSerializable()
class ProductModel {
  ProductModel({required this.products});
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  final List<ProductDataModel> products;
}

@JsonSerializable()
class ProductDataModel {
  ProductDataModel({
    required this.price,
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.category,
  });
  factory ProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProductDataModelFromJson(json);

  final int? price;
  final String? id;
  final String? title;
  final String? description;
  final List<String>? images;
  final ProductCategoryModel? category;
}

@JsonSerializable()
class ProductCategoryModel {
  ProductCategoryModel({this.id, this.name});
  factory ProductCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCategoryModelFromJson(json);
  String? id;
  String? name;
}
