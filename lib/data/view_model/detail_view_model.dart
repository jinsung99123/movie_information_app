import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/repository/api_service.dart';
import 'package:movie_information_app/data/model/detail.dart';

class DetailViewModel extends StateNotifier<AsyncValue<MovieDetail>> {
  final MovieApi movieApi;
  final int movieId;

  DetailViewModel(this.movieApi, this.movieId) : super(const AsyncValue.loading()) {
    fetchAllDetails();
  }

  Future<void> fetchAllDetails() async {
    try {
      final json = await movieApi.fetchMovieDetail(movieId);
      final detail = MovieDetail.fromJson(json);
      state = AsyncValue.data(detail);
    } catch (e, st) {
      print('Error fetching movie details: $e');
      state = AsyncValue.error(e, st);
    }
  }
}
