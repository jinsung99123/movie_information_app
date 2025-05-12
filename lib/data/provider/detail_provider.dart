import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/api/api_service.dart';
import 'package:movie_information_app/data/model/detail.dart';
import 'package:movie_information_app/data/view_model/detail_view_model.dart';

final detailViewModelProvider =
    StateNotifierProvider<DetailViewModel, AsyncValue<MovieDetail>>(
  (ref) => DetailViewModel(MovieApi()),
);
