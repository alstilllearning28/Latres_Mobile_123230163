import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/show_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com';

  static Future<List<Show>> fetchShows() async {
    final response = await http.get(Uri.parse('$baseUrl/shows')); 
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((json) => Show.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load shows');
    }
  }

  static Future<Show> fetchShowDetails(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/shows/$id')); 
    if (response.statusCode == 200) {
      return Show.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load show detail');
    }
  }
}