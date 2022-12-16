import 'package:movie_app/app/src/core/erorr/Exception.dart';
import 'package:movie_app/app/src/tves/data/dataSource/tvRemoteDataSource.dart';
import 'package:movie_app/app/src/tves/domain/entities/tv.dart';
import 'package:movie_app/app/src/core/erorr/Failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetails.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetailsSessionInfo.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvRecommendtion.dart';
import 'package:movie_app/app/src/tves/domain/repositroy/base_tv_repositroy.dart';

class TvRepositry extends BaseTvRepository {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvRepositry(this.baseTvRemoteDataSource);
  @override
  Future<Either<Faliure, ResultsTv>> getOnTheAir({required int pageNum}) async {
    final response = await baseTvRemoteDataSource.getOnTheAirTv(pageNum: pageNum);
    try {
      return right(response);
    } on ServerException catch (faliure) {
      return left(ServerFaliure(faliure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, ResultsTv>> getPopularTv({required int pageNum}) async {
    final response = await baseTvRemoteDataSource.getPopularTv(pageNum: pageNum);
    try {
      return right(response);
    } on ServerException catch (faliure) {
      return left(ServerFaliure(faliure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, ResultsTv>> getTopRatedTv({required int pageNum}) async {
    final response = await baseTvRemoteDataSource.getTopRatedTv(pageNum: pageNum);
    try {
      return right(response);
    } on ServerException catch (faliure) {
      return left(ServerFaliure(faliure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, TvDetails>> getDetailsTv({required int id}) async {
    final response = await baseTvRemoteDataSource.getDetailsTv(id: id);
    try {
      return right(response);
    } on ServerException catch (faliure) {
      return left(ServerFaliure(faliure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, List<TVDetailsSessionInfo>>> getTvDetailsSession({
    required int tvId,
    required int sessionNum,
  }) async {
    final response = await baseTvRemoteDataSource.gettvDetailsSessionInfo(
      tvId: tvId,
      sessionNum: sessionNum,
    );
    try {
      return right(response);
    } on ServerException catch (faliure) {
      return left(ServerFaliure(faliure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, List<TvRecommendtion>>> getTvRecommndtion({required int tvId}) async {
    final response = await baseTvRemoteDataSource.getTvRecommndition(tvId: tvId);
    try {
      return right(response);
    } on ServerException catch (faliure) {
      return left(ServerFaliure(faliure.erorrMessageModel.statusMessage));
    }
  }
}
