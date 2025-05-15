import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:movie_information_app/clean_architecture/data/data_sources/movie_data_source.dart';
import 'package:movie_information_app/clean_architecture/data/data_sources/movie_data_source_impl.dart';
import 'package:movie_information_app/clean_architecture/data/repositories/movie_repository_impl.dart';
import 'package:movie_information_app/clean_architecture/domain/usecases/fetch_movie_detail_usecase.dart';
import 'package:movie_information_app/clean_architecture/domain/usecases/fetch_now_playing_movies_usecase.dart';
import 'package:movie_information_app/clean_architecture/domain/usecases/fetch_popular_movies_usecase.dart';
import 'package:movie_information_app/clean_architecture/domain/usecases/fetch_top_rated_movies_usecase.dart';
import 'package:movie_information_app/clean_architecture/domain/usecases/fetch_upcoming_movies_usecase.dart';

final _movieDataSourceProvider = Provider<MovieDataSource>((ref) {
  final client = http.Client();
  return MovieDataSourceImpl(client: client);
});

final _movieRepositoryProvider = Provider((ref) {
  final dataSource = ref.read(_movieDataSourceProvider);
  return MovieRepositoryImpl(dataSource);
});



final fetchNowPlayingMoviesUsecaseProvider = Provider((ref){
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchNowPlayingMoviesUsecase(movieRepo);
});

final fetchPopularMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider); 
  return FetchPopularMoviesUsecase(movieRepo);
});

final fetchTopRatedMoviesUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider); 
  return FetchTopRatedMoviesUsecase(movieRepo);
});

final fetchMovieDetailUsecaseProvider = Provider((ref) {
  final movieRepo = ref.read(_movieRepositoryProvider); 
  return FetchMovieDetailUsecase(movieRepo);
});

final fetchUpcomingMoviesUsecaseProvider = Provider((ref){
  final movieRepo = ref.read(_movieRepositoryProvider);
  return FetchUpcomingMoviesUsecase(movieRepo);
});