import 'package:equatable/equatable.dart';

import 'movie.dart';

class MovieResult extends Equatable {
  final int page;
  final List<Movie> result;
  final int totalPage;
  final int totalResults;

  const MovieResult(
      {required this.page,
      required this.result,
      required this.totalPage,
      required this.totalResults});

  @override
  List<Object?> get props => [page, result, totalPage, totalResults];
}
