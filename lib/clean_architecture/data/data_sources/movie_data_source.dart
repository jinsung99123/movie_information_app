import 'package:movie_information_app/clean_architecture/data/dtos/movie_dto.dart';

abstract interface class MovieDataSource {
  Future<List<MovieDto>> fetchNowPlayingMovies();
  Future<MovieDto> fetchMovieDetail(int movieId);
  Future<List<MovieDto>> fetchPopularMovies();
  Future<List<MovieDto>> fetchTopRatedMovies();
  Future<List<MovieDto>> fetchUpcomingMovies();
}