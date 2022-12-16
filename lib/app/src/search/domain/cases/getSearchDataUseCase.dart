import 'package:dartz/dartz.dart';
import 'package:movie_app/app/src/core/erorr/Failure.dart';
import 'package:movie_app/app/src/search/domain/entities/search.dart';
import 'package:movie_app/app/src/search/domain/repositroy/base_Search_repositroy.dart';

class GetSearchDataUseCase {
  final BaseSearchRepository baseSearchRepository;

  GetSearchDataUseCase(this.baseSearchRepository);
  Future<Either<Faliure, Search>> getData({String? query, int? pageNum}) async {
    return await baseSearchRepository.getSearchResault(query: query, pageNum: pageNum);
  }
}
