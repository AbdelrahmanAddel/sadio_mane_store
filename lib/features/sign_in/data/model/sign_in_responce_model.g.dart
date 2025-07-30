// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponceModel _$SignInResponceModelFromJson(Map<String, dynamic> json) =>
    SignInResponceModel(
      data: json['data'] == null
          ? null
          : SignInDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponceModelToJson(
        SignInResponceModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
