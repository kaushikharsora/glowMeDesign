import 'dart:convert';

import 'package:glowme/model/user_model.dart';
import 'package:glowme/service/base_url.dart';
import 'package:http/http.dart' as http;
class UserApi {
 static Future<UserDetails> createUser(String phoneNumber) async {
    UserDetails? userDetails; // Declare the variable outside the try block
    try {
      var url = Uri.parse('${ApiContants.base_url}user/createusers');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({'phoneNumber': phoneNumber}),
      );
       print('response statsu :: ${response.statusCode}');
        print('response mess :: ${response.body}');
      if (response.statusCode == 201) {
        final data = json.decode(response.body);
        userDetails = UserDetails.fromJson(data);
      } else {
        // Handle other status codes if needed
      }
    } catch (err) {
      // Handle network or other errors
      throw err;
    }

    return userDetails!;
  }
  static  Future<UserDetails> signInUser(String phoneNumber) async {
    UserDetails? userDetails; // Declare the variable outside the try block
    try {
      var url = Uri.parse('${ApiContants.base_url}user/signin');
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({'phoneNumber': phoneNumber}),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        userDetails = UserDetails.fromJson(data);
      } else {
        // Handle other status codes if needed
       
      }
    } catch (err) {
      // Handle network or other errors
      throw err;
    }

    return userDetails!;
  }

   static Future<UserDetails> fetchAllUsers() async {
    UserDetails? userDetails; // Declare the variable outside the try block
    try {
      var url = Uri.parse('${ApiContants.base_url}user/fetchAllUsers');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
       
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('user data ::: $data');
        userDetails = UserDetails.fromJson(data);
      } else {
        // Handle other status codes if needed
      }
    } catch (err) {
      // Handle network or other errors
      rethrow;
    }

    return userDetails!;
  }

}
