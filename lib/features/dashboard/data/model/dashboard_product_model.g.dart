// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashBoardModel _$DashBoardModelFromJson(Map<String, dynamic> json) =>
    DashBoardModel(
      data:
          json['data'] == null
              ? null
              : DashBoardProductModel.fromJson(
                json['data'] as Map<String, dynamic>,
              ),
    );

Map<String, dynamic> _$DashBoardModelToJson(DashBoardModel instance) =>
    <String, dynamic>{'data': instance.data};

DashBoardProductModel _$DashBoardProductModelFromJson(
  Map<String, dynamic> json,
) => DashBoardProductModel(
  products:
      (json['products'] as List<dynamic>?)
          ?.map((e) => IDModel.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$DashBoardProductModelToJson(
  DashBoardProductModel instance,
) => <String, dynamic>{'products': instance.products};

IDModel _$IDModelFromJson(Map<String, dynamic> json) =>
    IDModel(id: json['id'] as String?);

Map<String, dynamic> _$IDModelToJson(IDModel instance) => <String, dynamic>{
  'id': instance.id,
};
