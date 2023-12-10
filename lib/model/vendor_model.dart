import 'package:json_annotation/json_annotation.dart';
part 'vendor_model.g.dart';

@JsonSerializable()

class Vendor {
   final bool success;
   final List<VendorData> data;

    Vendor({
        required this.success,
        required this.data,
    });
factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  Map<String, dynamic> toJson() => _$VendorToJson(this);
    
}
@JsonSerializable()
class VendorData {
  @JsonKey(name: '_id')
   final String id;

   final String name;
   final double rating;
   final int experience;
   final String description;
     String? vendorImage;
   final String category;
   final List<String> services;
   final  DateTime availableTime;
   final DateTime endTime;
   final String address;
   final bool isAvailable;
   @JsonKey(name: '__v')
   int? v;
  

    VendorData({
        required this.id,
        required this.name,
        required this.rating,
        required this.experience,
        required this.description,
         this.vendorImage,
        required this.category,
        required this.services,
        required this.availableTime,
        required this.endTime,
        required this.address,
        required this.isAvailable,
        this.v,
       
    });
factory VendorData.fromJson(Map<String, dynamic> json) => _$VendorDataFromJson(json);

  Map<String, dynamic> toJson() => _$VendorDataToJson(this);
    
}
