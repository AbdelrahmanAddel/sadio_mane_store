import 'package:freezed_annotation/freezed_annotation.dart';
part 'get_users_responce_model.g.dart';

@JsonSerializable()
class GetUsersResponceModel {
  GetUsersResponceModel({required this.data});
  factory GetUsersResponceModel.fromJson(Map<String, dynamic> json) =>
      _$GetUsersResponceModelFromJson(json);

  final UsersModel? data;
}

@JsonSerializable()
class UsersModel {
  UsersModel({required this.usersList});
  factory UsersModel.fromJson(Map<String, dynamic> json) =>
      _$UsersModelFromJson(json);
  final List<UsersDataModel> usersList;
}

@JsonSerializable()
class UsersDataModel {
  UsersDataModel({required this.id, required this.name, required this.email});
  factory UsersDataModel.fromJson(Map<String, dynamic> json) =>
      _$UsersDataModelFromJson(json);
  final String id;
  final String name;
  final String email;
}
