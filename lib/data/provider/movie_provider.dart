import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/api/api_service.dart';
import 'package:movie_information_app/data/view_model/movie_view_model.dart';

final movieProvider = StateNotifierProvider<MovieViewModel, MovieState>((ref) {
  return MovieViewModel(MovieApi());
});
