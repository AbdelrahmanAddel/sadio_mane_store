import 'package:json_annotation/json_annotation.dart';
part 'sign_up_request_model.g.dart';

@JsonSerializable()
class SignUpRequestModel {
  SignUpRequestModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.userAvatar,
  });
  @JsonKey(name: 'name')
  final String fullName;
  final String email;
  final String password;
  @JsonKey(name: 'avatar')
  final String userAvatar;
  Map<String, dynamic> toJson() => _$SignUpRequestModelToJson(this);
}
