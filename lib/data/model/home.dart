class Movie {
  final int id;
  final String posterPath;

  Movie({required this.id, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(id: json['id'] ?? 0, posterPath: json['poster_path'] ?? '');
  }
}
