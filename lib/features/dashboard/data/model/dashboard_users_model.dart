import 'package:freezed_annotation/freezed_annotation.dart';
part 'dashboard_users_model.g.dart';

@JsonSerializable()
class DashboardUsersModel {
  DashboardUsersModel({this.data});

  factory DashboardUsersModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardUsersModelFromJson(json);
  final UserModel? data;
}

@JsonSerializable()
class UserModel {
  UserModel({this.users});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  final List<UserID>? users;
}

@JsonSerializable()
class UserID {
  UserID(this.id);
  factory UserID.fromJson(Map<String, dynamic> json) => _$UserIDFromJson(json);
  final String id;
}
