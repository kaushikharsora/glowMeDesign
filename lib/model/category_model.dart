import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class Category {
  bool success;
  List<CategoryData> data;

  Category({
    required this.success,
    required this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}

@JsonSerializable()
class CategoryData {
  final String id;
  final String categoryName;
  final String categoryImage;
  final String description;

  CategoryData({
    required this.id,
    required this.categoryName,
    required this.categoryImage,
    required this.description,
  });

  factory CategoryData.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);
}
