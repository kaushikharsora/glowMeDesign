// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      success: json['success'] as bool,
      data: (json['data'] as List<dynamic>)
          .map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'success': instance.success,
      'data': instance.data,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) => CategoryData(
      id: json['id'] as String,
      categoryName: json['categoryName'] as String,
      categoryImage: json['categoryImage'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryName': instance.categoryName,
      'categoryImage': instance.categoryImage,
      'description': instance.description,
    };
