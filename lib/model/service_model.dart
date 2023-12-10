import 'package:json_annotation/json_annotation.dart';
part 'service_model.g.dart';


@JsonSerializable()
class Service {
  bool success;
 
  List<ServiceData> data;

  Service({
    required this.success,
   
    required this.data,
  });

  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceToJson(this);
}

@JsonSerializable()
class ServiceData {
 String? serviceName; // Make it nullable
  String? serviceImage; // Make it nullable
  String? categoryId; 
   @JsonKey(name: '__v')  // Make it nullable
  int? v;   
  @JsonKey(name: '_id')
  final String id;
 

  ServiceData({
     this.serviceName,
     this.serviceImage,
     this.categoryId,
    required this.id,
     this.v,
  });

  factory ServiceData.fromJson(Map<String, dynamic> json) =>
      _$ServiceDataFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceDataToJson(this);
}
