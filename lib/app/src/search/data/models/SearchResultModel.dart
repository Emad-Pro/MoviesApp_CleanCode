import 'package:movie_app/app/src/search/domain/entities/search.dart';

class SearchResultModel extends SearchReslut {
  const SearchResultModel(
      {required super.id,
      required super.mediaType,
      required super.originalLanguage,
      required super.originalTitle,
      required super.overview,
      required super.posterPath,
      required super.releaseDate,
      required super.voteAverage});
  factory SearchResultModel.fromJson(Map<String, dynamic> json) {
    return SearchResultModel(
        id: json['id'],
        mediaType: json['media_type'],
        originalLanguage: json['original_language'] ?? '',
        originalTitle: json['original_title'] ?? json['name'],
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? json['backdrop_path'] ?? json['profile_path'] ?? '',
        releaseDate: json['release_date'] ?? '',
        voteAverage: json['vote_average'] ?? '');
  }
}
