import 'package:movie_information_app/clean_architecture/domain/entities/movie.dart';
import 'package:movie_information_app/clean_architecture/domain/repositories/movie_repository.dart';

class FetchUpcomingMoviesUsecase {
  FetchUpcomingMoviesUsecase(this._movieRepository);
  final MovieRepository _movieRepository;

  Future<List<Movie>> execute() async {
    return _movieRepository.fetchUpcomingMovies();
  }
}