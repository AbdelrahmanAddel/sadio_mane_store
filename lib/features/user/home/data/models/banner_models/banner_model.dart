import 'package:json_annotation/json_annotation.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_data_model.dart';

part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
  BannerModel({required this.bannerData});

  factory BannerModel.fromJson(Map<String, dynamic> json) =>
      _$BannerModelFromJson(json);

  @JsonKey(name: 'data')
  final BannerDataModel bannerData;
}
