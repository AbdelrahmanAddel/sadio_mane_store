// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInDataModel _$SignInDataModelFromJson(Map<String, dynamic> json) =>
    SignInDataModel(
      login:
          json['login'] == null
              ? null
              : Login.fromJson(json['login'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInDataModelToJson(SignInDataModel instance) =>
    <String, dynamic>{'login': instance.login};
