import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserDetails {
  final List<User>? users;

  UserDetails({
    required this.users,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailsToJson(this);
}

@JsonSerializable()
class User {
  Addresses? addresses;
  @JsonKey(name: '_id')
  final String id;
  String? fullName;
  final String phoneNumber;
  @JsonKey(name: 'userImage')
  String? userImage;
  String? email;
  int? profileProgress;

  User({
    this.addresses,
    required this.id,
    this.fullName,
    required this.phoneNumber,
    this.userImage,
    this.email,
    this.profileProgress,
  });
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class Addresses {
  final String type;
  final String? homeNo;
  final String? landMark;
  final String? village;
  final String? district;
  final String? state;
  final String? street;
  final String? city;
  final String? pincode;

  Addresses({
    required this.type,
    this.street,
    this.city,
    this.pincode,
    this.district,
    this.homeNo,
    this.landMark,
    this.state,
    this.village,
  });
  factory Addresses.fromJson(Map<String, dynamic> json) =>
      _$AddressesFromJson(json);

  Map<String, dynamic> toJson() => _$AddressesToJson(this);
}
