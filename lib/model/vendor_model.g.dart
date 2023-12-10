// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vendor _$VendorFromJson(Map<String, dynamic> json) => Vendor(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => VendorData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VendorToJson(Vendor instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

VendorData _$VendorDataFromJson(Map<String, dynamic> json) => VendorData(
      id: json['_id'] as String,
      name: json['name'] as String,
      rating: (json['rating'] as num).toDouble(),
      experience: json['experience'] as int,
      description: json['description'] as String,
      vendorImage: json['vendorImage'] as String?,
      category: json['category'] as String,
      services:
          (json['services'] as List<dynamic>).map((e) => e as String).toList(),
      availableTime: DateTime.parse(json['availableTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      address: json['address'] as String,
      isAvailable: json['isAvailable'] as bool,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$VendorDataToJson(VendorData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'experience': instance.experience,
      'description': instance.description,
      'vendorImage': instance.vendorImage,
      'category': instance.category,
      'services': instance.services,
      'availableTime': instance.availableTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'address': instance.address,
      'isAvailable': instance.isAvailable,
      '__v': instance.v,
    };
