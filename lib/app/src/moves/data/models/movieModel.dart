import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.voteAvg,
    required super.releaseDate,
  });
  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      backdropPath: json['backdrop_path'] ?? json['poster_path'] ?? '',
      genreIds: List.from(json['genre_ids'].map((e) => e)),
      overview: json['overview'],
      voteAvg: json['vote_average'].toDouble(),
      releaseDate: json['release_date'],
    );
  }
}
