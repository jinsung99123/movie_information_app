class MovieDetail {
  final String title;
  final String releaseDate;
  final String tagline;
  final String runtime;
  final String genres;
  final String overview;
  final String voteAverage;
  final String voteCount;
  final String popularity;
  final String budget;
  final String revenue;
  final String productionCompanies;

  MovieDetail({
    required this.title,
    required this.releaseDate,
    required this.tagline,
    required this.runtime,
    required this.genres,
    required this.overview,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.budget,
    required this.revenue,
    required this.productionCompanies,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      title: json['title'] ?? '제목없음',
      releaseDate: json['release_date'] ?? '',
      tagline: json['tagline'] ?? '',
      runtime: json['runtime'] ?? 0,
      genres: json['genres'] ?? [],
      overview: json['overview'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] ?? 0).toDouble(),
      budget: json['budget'] ?? 0,
      revenue: json['revenue'] ?? 0,
      productionCompanies: json['production_companies'] ?? [],
    );
  }
}
