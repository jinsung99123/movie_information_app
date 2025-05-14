class MovieDto {
  final int id;
  final String posterPath;

  // Detail info
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

  MovieDto({
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

  factory MovieDto.fromJson(Map<String, dynamic> json) {
    return MovieDto(
      id: json['id'] ?? 0,
      posterPath: json['poster_path'] ?? '',
      title: json['title'],
      releaseDate: json['release_date'],
      tagline: json['tagline'],
      runtime: json['runtime']?.toString(),
      genres: (json['genres'] as List?)?.map((e) => e['name'] ?? '').cast<String>().toList(),
      overview: json['overview'],
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'],
      popularity: (json['popularity'] ?? 0).toDouble(),
      budget: json['budget'],
      revenue: json['revenue'],
      productionCompanies: (json['production_companies'] as List?)?.cast<Map<String, dynamic>>(),
    );
  }
}
