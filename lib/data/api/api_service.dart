import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieApi {
  final String apiKey = 'f8f541812e1aae2feeaab5cae1eb9c93';
  final String baseUrl = 'https://api.themoviedb.org/3';
     static const String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOGY1NDE4MTJlMWFhZTJmZWVhYWI1Y2FlMWViOWM5MyIsIm5iZiI6MTc0Njk2NTQwMC44NTYsInN1YiI6IjY4MjA5Mzk4OTE5ZDkzYWZlNjg2M2NmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EJgBJYNAY_LPiNMw58_rjpDgJ1EvOJeQD39fb6bIoIk';

  Future<List<dynamic>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/discover/movie?api_key=$apiKey&language=en-US&page=1&sort_by=popularity.desc'
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('영화 불러오기 실패');
    }
  }

  Future<List<dynamic>> fetchTopRatedMovies() async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/discover/movie?api_key=$apiKey&language=en-US&page=1&sort_by=vote_average.desc'
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('영화 불러오기 실패');
    }
  }

  Future<List<dynamic>> fetchUpcomingMovies() async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=1'
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('영화 불러오기 실패');
    }
  }

  Future<List<dynamic>> fetchNowPlayingMovies() async {
    final response = await http.get(
      Uri.parse(
        '$baseUrl/movie/now_playing?api_key=$apiKey&language=en-US&page=1'
      ),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('영화 불러오기 실패');
    }
  }
}