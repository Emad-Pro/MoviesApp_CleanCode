import 'package:dio/dio.dart';
import 'package:movie_app/app/src/search/data/models/SearchModel.dart';

import '../../../core/erorr/Exception.dart';
import '../../../core/network/api_Constance.dart';
import '../../../core/network/erorrMessageModel.dart';

abstract class BaseSearchRemoteDataSource {
  Future<SearchModel> getSearchData({String? query, int? pageNum});
}

class SearchRemoteDataSource extends BaseSearchRemoteDataSource {
  @override
  Future<SearchModel> getSearchData({String? query, int? pageNum}) async {
    final response =
        await Dio().get(ApiConstance.searchTvAndMoviePath(query: query, pageNum: pageNum));

    if (response.statusCode == 200) {
      return SearchModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }
}
