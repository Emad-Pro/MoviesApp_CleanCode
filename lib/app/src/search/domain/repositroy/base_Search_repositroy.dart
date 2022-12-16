import 'package:dartz/dartz.dart';
import 'package:movie_app/app/src/core/erorr/Failure.dart';
import 'package:movie_app/app/src/search/domain/entities/search.dart';

abstract class BaseSearchRepository {
  Future<Either<Faliure, Search>> getSearchResault({String? query, int? pageNum});
}
