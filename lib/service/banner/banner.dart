import 'dart:convert';

import 'package:glowme/model/banner_model.dart';
import 'package:glowme/service/base_url.dart';
import 'package:http/http.dart' as http;

class BannerApi{
  static Future<BannerModel> fetchAllBanners() async {
    BannerModel? banner; // Declare the variable outside the try block
    try {
      var url = Uri.parse('${ApiContants.base_url}banner/fetchAllBanners');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
       
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        banner = BannerModel.fromJson(data);
      } else {
        // Handle other status codes if needed
      }
    } catch (err) {
      // Handle network or other errors
      rethrow;
    }

    return banner!;
  }
}