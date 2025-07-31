import 'package:json_annotation/json_annotation.dart';

part 'role_responce_model.g.dart';

@JsonSerializable()
class RoleResponceModel {
  RoleResponceModel({
    this.id,
    this.email,
    this.password,
    this.name,
    this.role,
    this.avatar,
    this.creationAt,
  });
  factory RoleResponceModel.fromJson(Map<String, dynamic> json) =>
      _$RoleResponceModelFromJson(json);
  int? id;
  String? email;
  String? password;
  String? name;
  String? role;
  String? avatar;
  String? creationAt;
}
