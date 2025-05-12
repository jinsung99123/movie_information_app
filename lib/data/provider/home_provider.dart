import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_information_app/data/api/api_service.dart';
import 'package:movie_information_app/data/model/home.dart';
import 'package:movie_information_app/data/view_model/home_view_model.dart';

final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, AsyncValue<Map<String, List<Movie>>>>(
  (ref) => HomeViewModel(MovieApi()),
);
