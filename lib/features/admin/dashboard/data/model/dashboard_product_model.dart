import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_product_model.g.dart';

@JsonSerializable()
class DashBoardModel {

  DashBoardModel({this.data});
  factory DashBoardModel.fromJson(Map<String, dynamic> json) =>
      _$DashBoardModelFromJson(json);

  DashBoardProductModel? data;
}

@JsonSerializable()
class DashBoardProductModel {
  DashBoardProductModel({this.products});
  factory DashBoardProductModel.fromJson(Map<String, dynamic> json) =>
      _$DashBoardProductModelFromJson(json);

  List<IDModel>? products;
}

@JsonSerializable()
class IDModel {
  IDModel({this.id});
  factory IDModel.fromJson(Map<String, dynamic> json) =>
      _$IDModelFromJson(json);

  String? id;
}
