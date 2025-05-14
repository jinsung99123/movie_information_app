import 'package:movie_information_app/clean_architecture/domain/entities/movie.dart';
import 'package:movie_information_app/clean_architecture/domain/repositories/movie_repository.dart';

class FetchMovieDetailUsecase {
  FetchMovieDetailUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<Movie> execute(int movieId) async {
    return _movieRepository.fetchMovieDetail(movieId);
  }
}