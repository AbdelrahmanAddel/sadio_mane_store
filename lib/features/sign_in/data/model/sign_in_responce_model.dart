import 'package:json_annotation/json_annotation.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sub_models/responce/sign_in_data_model.dart';

part 'sign_in_responce_model.g.dart';

@JsonSerializable()
class SignInResponceModel {
  SignInResponceModel({this.data});
  factory SignInResponceModel.fromJson(Map<String, dynamic> json) =>
      _$SignInResponceModelFromJson(json);
  final SignInDataModel? data;
}
