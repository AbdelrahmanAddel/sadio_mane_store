// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardUsersModel _$DashboardUsersModelFromJson(Map<String, dynamic> json) =>
    DashboardUsersModel(
      data:
          json['data'] == null
              ? null
              : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DashboardUsersModelToJson(
  DashboardUsersModel instance,
) => <String, dynamic>{'data': instance.data};

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  users:
      (json['users'] as List<dynamic>?)
          ?.map((e) => UserID.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'users': instance.users,
};

UserID _$UserIDFromJson(Map<String, dynamic> json) =>
    UserID(json['id'] as String);

Map<String, dynamic> _$UserIDToJson(UserID instance) => <String, dynamic>{
  'id': instance.id,
};
