import 'package:movie_app/app/src/moves/data/models/genersModel.dart';

import '../../domain/entities/Moviegenres.dart';
import '../../domain/entities/movieDetails.dart';

class MovieDetailsModel extends MovieDetails {
  const MovieDetailsModel({
    required super.backdropPath,
    required super.overview,
    required super.id,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
    required super.genres,
  });
  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      id: json['id'],
      releaseDate: json['release_date'],
      runtime: json['runtime'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
    );
  }
}
