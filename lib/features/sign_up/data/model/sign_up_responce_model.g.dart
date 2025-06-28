// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_responce_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponceModel _$SignUpResponceModelFromJson(Map<String, dynamic> json) =>
    SignUpResponceModel(
      data:
          json['data'] == null
              ? null
              : AddUserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignUpResponceModelToJson(
  SignUpResponceModel instance,
) => <String, dynamic>{'data': instance.data};
