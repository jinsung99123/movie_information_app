

import 'package:movie_information_app/clean_architecture/domain/entities/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> fetchNowPlayingMovies();
  Future<Movie> fetchMovieDetail(int movieId);
  Future<List<Movie>> fetchPopularMovies();
  Future<List<Movie>> fetchTopRatedMovies();
  Future<List<Movie>> fetchUpcomingMovies();
}