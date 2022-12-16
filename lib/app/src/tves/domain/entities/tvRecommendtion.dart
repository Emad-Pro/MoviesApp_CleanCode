import 'package:equatable/equatable.dart';

class TvRecommendtion extends Equatable {
  final int id;
  final String backdropPath;

  final String name;

  final String overview;

  final String posterPath;

  final String mediaType;

  final double voteAverage;

  const TvRecommendtion({
    required this.id,
    required this.backdropPath,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.mediaType,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        backdropPath,
        name,
        overview,
        posterPath,
        mediaType,
        voteAverage,
      ];
}
