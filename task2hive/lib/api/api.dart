import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiController {
  final String url = "https://fakestoreapi.com/products";

  Future<List<dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse(url),
    );

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      return responseData;
    } else {
      throw Exception(
          'Failed to load products'); 
    }
  }
}
