import 'package:movie_information_app/clean_architecture/data/data_sources/movie_data_source.dart';
import 'package:movie_information_app/clean_architecture/domain/repositories/movie_repository.dart';
import 'package:movie_information_app/clean_architecture/domain/entities/movie.dart';


class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<Movie> fetchMovieDetail(int movieId) async {
    final result = await _movieDataSource.fetchMovieDetail(movieId);

    return Movie(
      id: result.id,
      posterPath: result.posterPath,
      title: result.title,
      releaseDate: result.releaseDate,
      tagline: result.tagline,
      runtime: result.runtime,
      genres: result.genres,
      overview: result.overview,
      voteAverage: result.voteAverage,
      voteCount: result.voteCount,
      popularity: result.popularity,
      budget: result.budget,
      revenue: result.revenue,
      productionCompanies: result.productionCompanies,
    );
  }

  @override
  Future<List<Movie>> fetchNowPlayingMovies() async {
    final result = await _movieDataSource.fetchNowPlayingMovies();
    return result.map((e) => Movie(
      id: e.id,
      posterPath: e.posterPath,
      title: e.title,
      releaseDate: e.releaseDate,
      tagline: e.tagline,
      runtime: e.runtime,
      genres: e.genres,
      overview: e.overview,
      voteAverage: e.voteAverage,
      voteCount: e.voteCount,
      popularity: e.popularity,
      budget: e.budget,
      revenue: e.revenue,
      productionCompanies: e.productionCompanies,
    )).toList();
  }

  @override
  Future<List<Movie>> fetchPopularMovies() async {
    final result = await _movieDataSource.fetchPopularMovies();
    return result.map((e) => Movie(
      id: e.id,
      posterPath: e.posterPath,
      title: e.title,
      releaseDate: e.releaseDate,
      tagline: e.tagline,
      runtime: e.runtime,
      genres: e.genres,
      overview: e.overview,
      voteAverage: e.voteAverage,
      voteCount: e.voteCount,
      popularity: e.popularity,
      budget: e.budget,
      revenue: e.revenue,
      productionCompanies: e.productionCompanies,
    )).toList();
  }

  @override
  Future<List<Movie>> fetchTopRatedMovies() async {
    final result = await _movieDataSource.fetchTopRatedMovies();
    return result.map((e) => Movie(
      id: e.id,
      posterPath: e.posterPath,
      title: e.title,
      releaseDate: e.releaseDate,
      tagline: e.tagline,
      runtime: e.runtime,
      genres: e.genres,
      overview: e.overview,
      voteAverage: e.voteAverage,
      voteCount: e.voteCount,
      popularity: e.popularity,
      budget: e.budget,
      revenue: e.revenue,
      productionCompanies: e.productionCompanies,
    )).toList();
  }

  @override
  Future<List<Movie>> fetchUpcomingMovies() async {
    final result = await _movieDataSource.fetchUpcomingMovies();
    return result.map((e) => Movie(
      id: e.id,
      posterPath: e.posterPath,
      title: e.title,
      releaseDate: e.releaseDate,
      tagline: e.tagline,
      runtime: e.runtime,
      genres: e.genres,
      overview: e.overview,
      voteAverage: e.voteAverage,
      voteCount: e.voteCount,
      popularity: e.popularity,
      budget: e.budget,
      revenue: e.revenue,
      productionCompanies: e.productionCompanies,
    )).toList();
  }
}
