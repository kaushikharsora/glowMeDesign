import 'package:json_annotation/json_annotation.dart';
part 'banner_model.g.dart';

@JsonSerializable()
class BannerModel {
   final bool success;
   final List<BannerData> data;

    BannerModel({
        required this.success,
        required this.data,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => _$BannerModelFromJson(json);

  Map<String, dynamic> toJson() => _$BannerModelToJson(this);
}

@JsonSerializable()
class BannerData {
  @JsonKey(name: '_id')
   final String id;
   final String title;
   final String description;
   @JsonKey(name:'bannerImage')
   final String image;
  

    BannerData({
        required this.id,
        required this.title,
        required this.description,
        required this.image,
    
    });

    factory BannerData.fromJson(Map<String, dynamic> json) => _$BannerDataFromJson(json);

  Map<String, dynamic> toJson() => _$BannerDataToJson(this);
}
