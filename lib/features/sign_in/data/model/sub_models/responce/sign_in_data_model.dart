import 'package:json_annotation/json_annotation.dart';
import 'package:sadio_mane_store/features/sign_in/data/model/sub_models/responce/login_sub_model.dart';
part 'sign_in_data_model.g.dart';

@JsonSerializable()
class SignInDataModel {
  SignInDataModel({this.login});

  factory SignInDataModel.fromJson(Map<String, dynamic> json) =>
      _$SignInDataModelFromJson(json);
  final Login? login;
}
