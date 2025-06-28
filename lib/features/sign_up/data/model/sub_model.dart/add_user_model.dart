import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_user_model.g.dart';

@JsonSerializable()
class AddUserModel {
  AddUserModel({this.id, this.name});

  factory AddUserModel.fromJson(Map<String, dynamic> json) =>
      _$AddUserModelFromJson(json);
  final String? id;
  final String? name;
}
