import '../../domain/entities/MovieResult.dart';
import '../../domain/entities/movie.dart';
import 'movieModel.dart';

class MovieResultModel extends MovieResult {
  const MovieResultModel(
      {required super.page,
      required super.result,
      required super.totalPage,
      required super.totalResults});
  factory MovieResultModel.fromJson(Map<String, dynamic> json) {
    List<MovieModel> listResult = [];
    json['results'].forEach((i) {
      listResult.add(MovieModel.fromJson(i));
    });
    return MovieResultModel(
        page: json['page'],
        result: listResult,
        totalPage: json['total_pages'],
        totalResults: json['total_results']);
  }
}
