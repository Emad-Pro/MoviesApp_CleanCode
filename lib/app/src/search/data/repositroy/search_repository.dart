import 'package:movie_app/app/src/search/data/dataSource/searchRemoteDataSource.dart';
import 'package:movie_app/app/src/search/data/models/SearchModel.dart';
import 'package:movie_app/app/src/search/domain/entities/search.dart';
import 'package:movie_app/app/src/core/erorr/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/src/search/domain/repositroy/base_Search_repositroy.dart';

import '../../../core/erorr/Exception.dart';

class SearchRepository extends BaseSearchRepository {
  final BaseSearchRemoteDataSource baseSearchRemoteDataSource;

  SearchRepository(this.baseSearchRemoteDataSource);
  @override
  Future<Either<Faliure, Search>> getSearchResault({String? query, int? pageNum}) async {
    final result = await baseSearchRemoteDataSource.getSearchData(query: query, pageNum: pageNum);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFaliure(failure.erorrMessageModel.statusMessage));
    }
  }
}
