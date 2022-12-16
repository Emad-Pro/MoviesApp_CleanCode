import 'package:dartz/dartz.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/tv.dart';
import '../repositroy/base_tv_repositroy.dart';

class GetTvPopularUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvPopularUseCase(this.baseTvRepository);
  Future<Either<Faliure, ResultsTv>> getData({required int pageNum}) async {
    return await baseTvRepository.getPopularTv(pageNum: pageNum);
  }
}
