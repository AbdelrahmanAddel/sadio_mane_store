import 'package:json_annotation/json_annotation.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_product_data_model.dart';

part 'banner_data_model.g.dart';

@JsonSerializable()
class BannerDataModel {
  BannerDataModel(this.banners);
  factory BannerDataModel.fromJson(Map<String, dynamic> json) =>
      _$BannerDataModelFromJson(json);

  @JsonKey(name: 'products')
  final List<BannerProductDataModel> banners;
}
