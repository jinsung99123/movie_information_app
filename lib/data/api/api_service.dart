import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_information_app/data/model/movie.dart';

class MovieApi {
  final String apiKey = 'f8f541812e1aae2feeaab5cae1eb9c93';
  final String baseUrl = 'https://api.themoviedb.org/3';
     static const String readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJmOGY1NDE4MTJlMWFhZTJmZWVhYWI1Y2FlMWViOWM5MyIsIm5iZiI6MTc0Njk2NTQwMC44NTYsInN1YiI6IjY4MjA5Mzk4OTE5ZDkzYWZlNjg2M2NmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.EJgBJYNAY_LPiNMw58_rjpDgJ1EvOJeQD39fb6bIoIk';


  Future<List<Movie>> fetchPopularMovies() async {
    final url = Uri.parse('$baseUrl/movie/popular?api_key=$apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List movies = data['results'];

      return movies.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}