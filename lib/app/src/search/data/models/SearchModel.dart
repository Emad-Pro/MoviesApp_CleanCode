import 'package:movie_app/app/src/search/domain/entities/search.dart';

import 'SearchResultModel.dart';

class SearchModel extends Search {
  const SearchModel(
      {required super.page,
      required super.totalPages,
      required super.totalResults,
      required super.results});
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    final List<SearchResultModel> resultsList = [];
    json['results'].forEach((v) {
      resultsList.add(SearchResultModel.fromJson(v));
    });
    return SearchModel(
        page: json['page'],
        results: resultsList,
        totalPages: json['total_pages'],
        totalResults: json['total_results']);
  }
}
