class MovieDetail {
  final String title;
  final String releaseDate;
  final String tagline;
  final String runtime;
  final List<String> genres;
  final String overview;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final int budget;
  final int revenue;
  final List<Map<String, dynamic>> productionCompanies; 

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
      runtime: json['runtime']?.toString() ?? '0',
      genres: List<String>.from(json['genres']?.map((e) => e['name'] ?? '') ?? []),
      overview: json['overview'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      voteCount: json['vote_count'] ?? 0,
      popularity: (json['popularity'] ?? 0).toDouble(),
      budget: json['budget'] ?? 0,
      revenue: json['revenue'] ?? 0,
      productionCompanies: List<Map<String, dynamic>>.from(
        json['production_companies']?.map((e) => e) ?? [],
      ), 
    );
  }
}
