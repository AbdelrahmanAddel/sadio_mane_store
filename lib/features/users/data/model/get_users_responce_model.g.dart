// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_users_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetUsersResponceModel _$GetUsersResponceModelFromJson(
  Map<String, dynamic> json,
) => GetUsersResponceModel(
  data:
      json['data'] == null
          ? null
          : UsersModel.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GetUsersResponceModelToJson(
  GetUsersResponceModel instance,
) => <String, dynamic>{'data': instance.data};

UsersModel _$UsersModelFromJson(Map<String, dynamic> json) => UsersModel(
  users:
      (json['users'] as List<dynamic>)
          .map((e) => UsersDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UsersModelToJson(UsersModel instance) =>
    <String, dynamic>{'users': instance.users};

UsersDataModel _$UsersDataModelFromJson(Map<String, dynamic> json) =>
    UsersDataModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$UsersDataModelToJson(UsersDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
