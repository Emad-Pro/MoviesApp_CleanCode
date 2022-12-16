import 'package:movie_app/app/src/tves/domain/entities/tv.dart';

class ResultsTvModel extends ResultsTv {
  const ResultsTvModel({required super.page, required super.results, required super.totalPages});
  factory ResultsTvModel.fromJson(Map<String, dynamic> json) {
    final List<TvModel> resultsList = [];
    json['results'].forEach((v) {
      resultsList.add(TvModel.fromJson(v));
    });
    return ResultsTvModel(
      results: resultsList,
      page: json['page'],
      totalPages: json['total_pages'],
    );
  }
}

class TvModel extends Tv {
  const TvModel({
    required super.id,
    required super.name,
    required super.backdropPath,
    required super.firstAirDate,
    required super.overview,
    required super.posterPath,
    required super.voateAvg,
  });
  factory TvModel.fromJson(Map<String, dynamic> json) {
    return TvModel(
      id: json['id'],
      name: json['name'],
      backdropPath: json['backdrop_path'] ?? '',
      firstAirDate: json['first_air_date'],
      overview: json['overview'],
      posterPath: json['poster_path'] ?? '',
      voateAvg: json['vote_average'].toDouble(),
    );
  }
}
