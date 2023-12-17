import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:glowme/model/service_model.dart';
import 'package:glowme/service/base_url.dart';
import 'package:http/http.dart' as http;

class ServiceApi{
  static Future<Service> fetchAllService() async {
    Service? service; // Declare the variable outside the try block
    try {
      var url = Uri.parse("${ConfigClass.baseUrl}${routes['fetchAllServices']}");
      final response = await http.get(url, headers: {'Content-Type': 'application/json',},
       
      );
       if (kDebugMode) {
         print('response status ::: ${response.statusCode}');
       }

      if (response.statusCode == 200) {
        print('inside here');
        final data = json.decode(response.body);
        if (kDebugMode) {
          print(data['data']);
        }
        service = Service.fromJson(data);

       if (kDebugMode) {
         print('response body ::: ${service}');
       }

      } else {
        // Handle other status codes if needed
      }
    } catch (err) {
      // Handle network or other errors
      rethrow;
    }

    return service!;
  }
}