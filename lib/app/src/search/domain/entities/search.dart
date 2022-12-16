import 'package:equatable/equatable.dart';

class Search extends Equatable {
  final int page;
  final int totalPages;
  final int totalResults;
  final List<SearchReslut> results;

  const Search(
      {required this.page,
      required this.totalPages,
      required this.totalResults,
      required this.results});

  @override
  List<Object?> get props => [
        page,
        totalPages,
        totalResults,
        results,
      ];
}

class SearchReslut extends Equatable {
  final int id;
  final String mediaType;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final String releaseDate;
  final dynamic voteAverage;

  const SearchReslut(
      {required this.id,
      required this.mediaType,
      required this.originalLanguage,
      required this.originalTitle,
      required this.overview,
      required this.posterPath,
      required this.releaseDate,
      required this.voteAverage});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        mediaType,
        originalLanguage,
        originalTitle,
        overview,
        posterPath,
        releaseDate,
        voteAverage
      ];
}
