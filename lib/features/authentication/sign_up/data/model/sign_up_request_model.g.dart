// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestModel _$SignUpRequestModelFromJson(Map<String, dynamic> json) =>
    SignUpRequestModel(
      fullName: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      userAvatar: json['avatar'] as String,
    );

Map<String, dynamic> _$SignUpRequestModelToJson(SignUpRequestModel instance) =>
    <String, dynamic>{
      'name': instance.fullName,
      'email': instance.email,
      'password': instance.password,
      'avatar': instance.userAvatar,
    };
