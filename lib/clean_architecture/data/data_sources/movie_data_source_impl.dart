import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_information_app/clean_architecture/data/dtos/movie_dto.dart';
import 'movie_data_source.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final http.Client client;
  final String apiKey = 'f8f541812e1aae2feeaab5cae1eb9c93';
  final String baseUrl = 'https://api.themoviedb.org/3';

  MovieDataSourceImpl({required this.client});

  @override
  Future<List<MovieDto>> fetchPopularMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/discover/movie?api_key=$apiKey&language=en-US&page=1&sort_by=popularity.desc'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List).map((e) => MovieDto.fromJson(e)).toList();
    } else {
      throw Exception('인기 영화 불러오기 실패');
    }
  }

  @override
  Future<List<MovieDto>> fetchTopRatedMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/top_rated?api_key=$apiKey&language=en-US&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List).map((e) => MovieDto.fromJson(e)).toList();
    } else {
      throw Exception('평점 높은 영화 불러오기 실패');
    }
  }

  @override
  Future<List<MovieDto>> fetchUpcomingMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/upcoming?api_key=$apiKey&language=en-US&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List).map((e) => MovieDto.fromJson(e)).toList();
    } else {
      throw Exception('개봉 예정 영화 불러오기 실패');
    }
  }

  @override
  Future<List<MovieDto>> fetchNowPlayingMovies() async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/now_playing?api_key=$apiKey&language=en-US&page=1'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['results'] as List).map((e) => MovieDto.fromJson(e)).toList();
    } else {
      throw Exception('현재 상영 중 영화 불러오기 실패');
    }
  }

  @override
  Future<MovieDto> fetchMovieDetail(int movieId) async {
    final response = await client.get(
      Uri.parse('$baseUrl/movie/$movieId?api_key=$apiKey&language=en-US'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MovieDto.fromJson(data);
    } else {
      throw Exception('영화 상세 정보 불러오기 실패');
    }
  }
}
