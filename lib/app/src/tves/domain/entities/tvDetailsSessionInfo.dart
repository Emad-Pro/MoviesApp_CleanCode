import 'package:equatable/equatable.dart';

class TVDetailsSessionInfo extends Equatable {
  final int id;
  final String name;
  final int episodeNumber;
  final String overview;
  final int runtime;
  final double voteAverage;
  final String stillPath;
  final String airdate;

  const TVDetailsSessionInfo(
      {required this.id,
      required this.name,
      required this.episodeNumber,
      required this.overview,
      required this.runtime,
      required this.voteAverage,
      required this.stillPath,
      required this.airdate});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, name, episodeNumber, overview, runtime, voteAverage, stillPath, airdate];
}
