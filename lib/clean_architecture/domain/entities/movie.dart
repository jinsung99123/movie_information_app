class Movie {
  final int id;
  final String posterPath;
  final String? title;
  final String? releaseDate;
  final String? tagline;
  final String? runtime;
  final List<String>? genres;
  final String? overview;
  final double? voteAverage;
  final int? voteCount;
  final double? popularity;
  final int? budget;
  final int? revenue;
  final List<Map<String, dynamic>>? productionCompanies;

  Movie({
    required this.id,
    required this.posterPath,
    this.title,
    this.releaseDate,
    this.tagline,
    this.runtime,
    this.genres,
    this.overview,
    this.voteAverage,
    this.voteCount,
    this.popularity,
    this.budget,
    this.revenue,
    this.productionCompanies,
  });
}
