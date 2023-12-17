import 'dart:convert';
import 'package:glowme/model/vendor_model.dart';
import 'package:glowme/service/base_url.dart';
import 'package:http/http.dart' as http;

class VendorApi{
  static Future<Vendor> fetchAllVendor() async {
    Vendor? vendor; // Declare the variable outside the try block
    try {
      var url = Uri.parse('${ConfigClass.baseUrl}vendor/fetchAllvendors');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
       
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        print('vendor data :::: $data');
        vendor = Vendor.fromJson(data);
      } else {
        // Handle other status codes if needed
      }
    } catch (err) {
      // Handle network or other errors
      rethrow;
    }

    return vendor!;
  }
}