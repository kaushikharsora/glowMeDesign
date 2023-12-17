import 'dart:convert';
import 'package:glowme/model/category_model.dart';
import 'package:glowme/service/base_url.dart';
import 'package:http/http.dart' as http;

class CategoryApi{
  static Future<Category> fetchAllCategory() async {
    Category? category; // Declare the variable outside the try block
    try {
      var url = Uri.parse('${ConfigClass.baseUrl}category/fetchAllCategories');
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
       
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        category = Category.fromJson(data);
      } else {
        // Handle other status codes if needed
      }
    } catch (err) {
      // Handle network or other errors
      rethrow;
    }

    return category!;
  }
}