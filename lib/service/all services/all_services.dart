import 'dart:convert';
import 'package:glowme/model/service_model.dart';
import 'package:glowme/service/base_url.dart';
import 'package:http/http.dart' as http;

class ServiceApi{
  static Future<Service> fetchAllService() async {
    Service? service; // Declare the variable outside the try block
    try {
      var url = Uri.parse('${ApiContants.base_url}service/fetchAllServices');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
       
      );
       print('response status ::: ${response.statusCode}');

      if (response.statusCode == 200) {
        print('inside here');
        final data = json.decode(response.body);
        print(data['data']);
        service = Service.fromJson(data);

       print('response body ::: ${service}');

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