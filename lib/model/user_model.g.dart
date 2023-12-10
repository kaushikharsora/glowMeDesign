// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetails _$UserDetailsFromJson(Map<String, dynamic> json) => UserDetails(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDetailsToJson(UserDetails instance) =>
    <String, dynamic>{
      'users': instance.users,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      addresses: json['addresses'] == null
          ? null
          : Addresses.fromJson(json['addresses'] as Map<String, dynamic>),
      id: json['_id'] as String,
      fullName: json['fullName'] as String?,
      phoneNumber: json['phoneNumber'] as String,
      userImage: json['userImage'] as String?,
      email: json['email'] as String?,
      profileProgress: json['profileProgress'] as int?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'addresses': instance.addresses,
      '_id': instance.id,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'userImage': instance.userImage,
      'email': instance.email,
      'profileProgress': instance.profileProgress,
    };

Addresses _$AddressesFromJson(Map<String, dynamic> json) => Addresses(
      home: Home.fromJson(json['home'] as Map<String, dynamic>),
      office: Home.fromJson(json['office'] as Map<String, dynamic>),
      others: Home.fromJson(json['others'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressesToJson(Addresses instance) => <String, dynamic>{
      'home': instance.home,
      'office': instance.office,
      'others': instance.others,
    };

Home _$HomeFromJson(Map<String, dynamic> json) => Home(
      type: json['type'] as String,
      street: json['street'] as String,
      city: json['city'] as String,
      pincode: json['pincode'] as String,
    );

Map<String, dynamic> _$HomeToJson(Home instance) => <String, dynamic>{
      'type': instance.type,
      'street': instance.street,
      'city': instance.city,
      'pincode': instance.pincode,
    };
