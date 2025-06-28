import 'package:json_annotation/json_annotation.dart';
import 'package:sadio_mane_store/features/sign_up/data/model/sub_model.dart/add_user_model.dart';

part 'sign_up_responce_model.g.dart';

@JsonSerializable()
class SignUpResponceModel {
  SignUpResponceModel({this.data});

  factory SignUpResponceModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponceModelFromJson(json);
  final AddUserModel? data;
}
