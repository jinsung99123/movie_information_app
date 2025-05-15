import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/repository/api_service.dart';
import 'package:movie_information_app/data/model/home.dart';

class HomeViewModel
    extends StateNotifier<AsyncValue<Map<String, List<Movie>>>> {
  final MovieApi movieApi;

  HomeViewModel(this.movieApi) : super(const AsyncValue.loading()) {
    fetchAllCategories();
  }

  Future<void> fetchAllCategories() async {
    try {
      final popular = await movieApi.fetchPopularMovies();
      final topRated = await movieApi.fetchTopRatedMovies();
      final upcoming = await movieApi.fetchUpcomingMovies();
      final nowPlaying = await movieApi.fetchNowPlayingMovies();

      state = AsyncValue.data({
        'popular': popular.map((e) => Movie.fromJson(e)).toList(),
        'topRated': topRated.map((e) => Movie.fromJson(e)).toList(),
        'upcoming': upcoming.map((e) => Movie.fromJson(e)).toList(),
        'nowPlaying': nowPlaying.map((e) => Movie.fromJson(e)).toList(),
      });
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
