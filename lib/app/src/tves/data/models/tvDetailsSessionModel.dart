import 'package:movie_app/app/src/tves/domain/entities/tvDetailsSessionInfo.dart';

class TvDetailsSessionModel extends TVDetailsSessionInfo {
  const TvDetailsSessionModel(
      {required super.id,
      required super.name,
      required super.episodeNumber,
      required super.overview,
      required super.runtime,
      required super.voteAverage,
      required super.stillPath,
      required super.airdate});
  factory TvDetailsSessionModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsSessionModel(
        id: json['id'],
        name: json['name'],
        episodeNumber: json['season_number'],
        overview: json['overview'],
        runtime: json['runtime'] ?? 0,
        voteAverage: json['vote_average'],
        stillPath: json['still_path'] ?? '',
        airdate: json['air_date'] ?? '');
  }
}
