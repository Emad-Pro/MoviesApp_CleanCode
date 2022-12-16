import 'package:dartz/dartz.dart';
import 'package:movie_app/app/src/core/erorr/Failure.dart';
import 'package:movie_app/app/src/moves/domain/repositroy/base_movies_repositroy.dart';
import 'package:movie_app/app/src/tves/domain/repositroy/base_tv_repositroy.dart';

import '../entities/tv.dart';

class GetTvOnTheAirUseCase {
  final BaseTvRepository baseTvRepository;

  GetTvOnTheAirUseCase(this.baseTvRepository);
  Future<Either<Faliure, ResultsTv>> getData({required int pageNum}) async {
    return await baseTvRepository.getOnTheAir(pageNum: pageNum);
  }
}
