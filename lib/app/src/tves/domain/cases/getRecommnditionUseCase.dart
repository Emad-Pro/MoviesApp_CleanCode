import 'package:dartz/dartz.dart';
import 'package:movie_app/app/src/core/erorr/Failure.dart';
import 'package:movie_app/app/src/moves/data/models/recommditionModel.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvRecommendtion.dart';
import 'package:movie_app/app/src/tves/domain/repositroy/base_tv_repositroy.dart';

class GetRecommnditionUseCase {
  final BaseTvRepository baseTvRepository;

  GetRecommnditionUseCase(this.baseTvRepository);
  Future<Either<Faliure, List<TvRecommendtion>>> GetRecommndition({required int tvId}) async {
    return await baseTvRepository.getTvRecommndtion(tvId: tvId);
  }
}
