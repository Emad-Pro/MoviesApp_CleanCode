import 'package:equatable/equatable.dart';

class ResultsTv extends Equatable {
  final int page;
  final List<Tv> results;
  final int totalPages;

  const ResultsTv({required this.page, required this.results, required this.totalPages});
  @override
  List<Object?> get props => [page, results, totalPages];
}

class Tv extends Equatable {
  final int id;
  final String name;
  final String backdropPath;
  final String firstAirDate;
  final String overview;
  final String posterPath;
  final double voateAvg;

  const Tv({
    required this.id,
    required this.name,
    required this.backdropPath,
    required this.firstAirDate,
    required this.overview,
    required this.posterPath,
    required this.voateAvg,
  });
  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        backdropPath,
        firstAirDate,
        overview,
        posterPath,
        voateAvg,
      ];
}
