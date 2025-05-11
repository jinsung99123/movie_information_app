class Movie {
  final String title;
  final String poster;
  final double rating;

  Movie({required this.title, required this.poster, required this.rating});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
    title: json['title'] ?? '제목없음', 
    poster: json['poster'] ?? '',
    rating: json['vote_average']?.toDouble()?? 0.0);
  }
}
