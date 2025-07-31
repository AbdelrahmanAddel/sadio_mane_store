import 'package:json_annotation/json_annotation.dart';
import 'package:sadio_mane_store/core/networking/api_strings_and_end_points.dart';

part 'login_sub_model.g.dart';

@JsonSerializable()
class Login {
  Login({this.accessToken, this.refreshToken});

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);
  @JsonKey(name: ApiStrings.accessToken)
  final String? accessToken;
  @JsonKey(name: ApiStrings.refreshToken)
  final String? refreshToken;
}
