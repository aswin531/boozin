import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:boozinmachinetask/core/constants/api_constants.dart';
import 'package:boozinmachinetask/data/model/boozin_data_model.dart';

class BoozinApiService {
  Future<List<BoozinDataModel>> fetchBoozinData() async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.endpoint}?key=${ApiConstants.apiKey}'
    );

    try {
      final response = await http.get(url);
      
      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((json) => BoozinDataModel.fromjson(json)).toList();
      } else {
        throw Exception('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}