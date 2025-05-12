import 'dart:convert';
import 'package:http/http.dart' as http;

class MovieApi {
  final String apiKey = 'f8f541812e1aae2feeaab5cae1eb9c93';
  final String baseUrl = 'https://api.themoviedb.org/3';

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
        '$baseUrl/discover/movie?api_key=$apiKey&language=en-US&page=1&sort_by=vote_average.desc&vote_count.gte=1000'
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