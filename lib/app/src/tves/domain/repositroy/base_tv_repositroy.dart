import 'package:dartz/dartz.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetails.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetailsSessionInfo.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvRecommendtion.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/tv.dart';

abstract class BaseTvRepository {
  Future<Either<Faliure, ResultsTv>> getOnTheAir({required int pageNum});
  Future<Either<Faliure, ResultsTv>> getPopularTv({required int pageNum});
  Future<Either<Faliure, ResultsTv>> getTopRatedTv({required int pageNum});
  Future<Either<Faliure, TvDetails>> getDetailsTv({required int id});
  Future<Either<Faliure, List<TVDetailsSessionInfo>>> getTvDetailsSession(
      {required int tvId, required int sessionNum});
  Future<Either<Faliure, List<TvRecommendtion>>> getTvRecommndtion({required int tvId});
}
