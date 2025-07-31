import 'package:freezed_annotation/freezed_annotation.dart';
part 'sign_in_request_body.g.dart';

@JsonSerializable()
class SignInRequestBody {
  SignInRequestBody({this.email, this.password});
  final String? email;
  final String? password;
  Map<String, dynamic> toJson() => _$SignInRequestBodyToJson(this);
}
