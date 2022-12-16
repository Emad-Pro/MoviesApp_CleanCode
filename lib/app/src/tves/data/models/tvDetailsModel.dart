import 'package:movie_app/app/src/tves/data/models/tvGenresMode.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetails.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvGenres.dart';

class TvDetailsModel extends TvDetails {
  const TvDetailsModel(
      {required super.backdropPath,
      required super.id,
      required super.name,
      required super.overview,
      required super.voteAverage,
      required super.genres,
      required super.numberOfEpsodes,
      required super.numberOfSesson,
      required super.firstAirDate});
  factory TvDetailsModel.fromJson(Map<String, dynamic> json) {
    return TvDetailsModel(
        backdropPath: json['backdrop_path'] ?? '',
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        voteAverage: json['vote_average'],
        genres: List<TvGenres>.from(json['genres'].map((e) => TVGenresModel.fromJson(e))),
        numberOfEpsodes: json['number_of_episodes'],
        numberOfSesson: json['number_of_seasons'],
        firstAirDate: json['first_air_date']);
  }
}
