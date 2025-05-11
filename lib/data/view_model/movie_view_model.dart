import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/api/api_service.dart';
import 'package:movie_information_app/data/model/movie.dart';

class MovieState {
  final List<Movie> movies;
  final bool isLoading;

  MovieState({
    required this.movies,
    required this.isLoading,
  });

  MovieState.initial()
      : movies = [],
        isLoading = false;
}

class MovieViewModel extends StateNotifier<MovieState> {
  final MovieApi movieApi;

  MovieViewModel(this.movieApi) : super(MovieState.initial());

  Future<void> fetchMovies() async {
    state = MovieState(movies: [], isLoading: true);

    final movies = await movieApi.fetchPopularMovies();
    state = MovieState(movies: movies, isLoading: false);
  }
}
