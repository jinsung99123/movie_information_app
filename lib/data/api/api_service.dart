import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/movie.dart';

class ApiService {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String apiKey = 'f8f541812e1aae2feeaab5cae1eb9c93';
  static const String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOGY1NDE4MTJlMWFhZTJmZWVhYWI1Y2FlMWViOWM5MyIsIm5iZiI6MTc0Njk2NTQwMC44NTYsInN1YiI6IjY4MjA5Mzk4OTE5ZDkzYWZlNjg2M2NmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EJgBJYNAY_LPiNMw58_rjpDgJ1EvOJeQD39fb6bIoIk';

  static Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse('$baseUrl/movie/popular?api_key=$apiKey&language=ko-KR'),
      headers: {
        'Authorization': 'Bearer $readAccessToken',
        'Content-Type': 'application/json;charset=utf-8',
      },
    );

    if (response.statusCode == 200) {
      final List results = jsonDecode(response.body)['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } else {
      throw Exception('영화 로드 실패');
    }
  }
}
