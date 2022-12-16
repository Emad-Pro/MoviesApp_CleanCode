import 'package:equatable/equatable.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvGenres.dart';

class TvDetails extends Equatable {
  final String backdropPath;
  final int id;
  final String name;
  final String overview;
  final double voteAverage;
  final List<TvGenres> genres;
  final int numberOfEpsodes;
  final int numberOfSesson;
  final String firstAirDate;

  const TvDetails({
    required this.backdropPath,
    required this.id,
    required this.name,
    required this.overview,
    required this.voteAverage,
    required this.genres,
    required this.numberOfEpsodes,
    required this.numberOfSesson,
    required this.firstAirDate,
  });

  @override
  List<Object?> get props => [
        backdropPath,
        id,
        name,
        overview,
        voteAverage,
        genres,
        numberOfEpsodes,
        numberOfSesson,
        firstAirDate,
      ];
}
