// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'role_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoleResponceModel _$RoleResponceModelFromJson(Map<String, dynamic> json) =>
    RoleResponceModel(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      role: json['role'] as String?,
      avatar: json['avatar'] as String?,
      creationAt: json['creationAt'] as String?,
    );

Map<String, dynamic> _$RoleResponceModelToJson(RoleResponceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'role': instance.role,
      'avatar': instance.avatar,
      'creationAt': instance.creationAt,
    };
