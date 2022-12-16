import 'package:equatable/equatable.dart';

import 'Moviegenres.dart';

class MovieDetails extends Equatable {
  final String? backdropPath;

  final int? id;
  final String? releaseDate;
  final String? overview;
  final int? runtime;
  final String? title;
  final double? voteAverage;
  final List<Genres>? genres;
  const MovieDetails(
      {required this.backdropPath,
      required this.overview,
      required this.id,
      required this.releaseDate,
      required this.runtime,
      required this.title,
      required this.voteAverage,
      required this.genres});

  @override
  // TODO: implement props
  List<Object?> get props => [
        backdropPath,
        id,
        releaseDate,
        runtime,
        title,
        voteAverage,
        overview,
      ];
}
