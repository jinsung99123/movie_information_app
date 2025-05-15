import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/repository/api_service.dart';
import 'package:movie_information_app/data/model/detail.dart';
import 'package:movie_information_app/data/view_model/detail_view_model.dart';

final detailViewModelProvider =
    StateNotifierProvider.family<DetailViewModel, AsyncValue<MovieDetail>, int>(
  (ref, movieId) => DetailViewModel(MovieApi(), movieId),
);
