// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Service _$ServiceFromJson(Map<String, dynamic> json) => Service(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => ServiceData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceToJson(Service instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

ServiceData _$ServiceDataFromJson(Map<String, dynamic> json) => ServiceData(
      serviceName: json['serviceName'] as String?,
      serviceImage: json['serviceImage'] as String?,
      categoryId: json['categoryId'] as String?,
      id: json['_id'] as String,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$ServiceDataToJson(ServiceData instance) =>
    <String, dynamic>{
      'serviceName': instance.serviceName,
      'serviceImage': instance.serviceImage,
      'categoryId': instance.categoryId,
      '__v': instance.v,
      '_id': instance.id,
    };
