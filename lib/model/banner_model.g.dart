// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerModel _$BannerModelFromJson(Map<String, dynamic> json) => BannerModel(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => BannerData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BannerModelToJson(BannerModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) => BannerData(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['bannerImage'] as String,
    );

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'bannerImage': instance.image,
    };
