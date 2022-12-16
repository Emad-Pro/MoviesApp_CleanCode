import 'package:movie_app/app/src/tves/domain/entities/tvRecommendtion.dart';

class TvRecommendtionModel extends TvRecommendtion {
  const TvRecommendtionModel(
      {required super.id,
      required super.backdropPath,
      required super.name,
      required super.overview,
      required super.posterPath,
      required super.mediaType,
      required super.voteAverage});
  factory TvRecommendtionModel.fromJson(Map<String, dynamic> json) {
    return TvRecommendtionModel(
        id: json['id'],
        backdropPath: json['backdrop_path'],
        name: json['name'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        mediaType: json['media_type'],
        voteAverage: json['vote_average']);
  }
}
