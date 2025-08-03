import 'package:json_annotation/json_annotation.dart';
part 'add_product_responce_model.g.dart';

@JsonSerializable()
class AddProductResponceModel {
  AddProductResponceModel({required this.data});
  factory AddProductResponceModel.fromJson(Map<String, dynamic> json) =>
      _$AddProductResponceModelFromJson(
          json);

  final AddProduct? data;
}

@JsonSerializable()
class AddProduct {
  AddProduct({required this.title});
  factory AddProduct.fromJson(Map<String, dynamic> json) =>
      _$AddProductFromJson(json);

  final String? title;
}
