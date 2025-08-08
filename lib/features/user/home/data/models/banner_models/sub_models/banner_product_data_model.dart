import 'package:json_annotation/json_annotation.dart';

part 'banner_product_data_model.g.dart';

@JsonSerializable()
class BannerProductDataModel {
  BannerProductDataModel({required this.title, required this.images});
  factory BannerProductDataModel.fromJson(Map<String, dynamic> json) =>
      _$BannerProductDataModelFromJson(json);

  final String? title;
  final List<String>? images;
}
