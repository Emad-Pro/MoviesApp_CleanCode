import 'package:dio/dio.dart';
import 'package:movie_app/app/src/core/erorr/Exception.dart';
import 'package:movie_app/app/src/core/network/api_Constance.dart';
import 'package:movie_app/app/src/core/network/erorrMessageModel.dart';
import 'package:movie_app/app/src/core/utils/app_constance.dart';

import 'package:movie_app/app/src/tves/data/models/TvModel.dart';
import 'package:movie_app/app/src/tves/data/models/tvDetailsModel.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetails.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvRecommendtion.dart';

import '../../domain/entities/tv.dart';
import '../models/tvDetailsSessionModel.dart';
import '../models/tvRecommnditionMode.dart';

abstract class BaseTvRemoteDataSource {
  Future<ResultsTvModel> getOnTheAirTv({required int pageNum});
  Future<ResultsTvModel> getPopularTv({required int pageNum});
  Future<ResultsTvModel> getTopRatedTv({required int pageNum});
  Future<TvDetailsModel> getDetailsTv({required int id});
  Future<List<TvDetailsSessionModel>> gettvDetailsSessionInfo(
      {required int tvId, required int sessionNum});
  Future<List<TvRecommendtionModel>> getTvRecommndition({required tvId});
}

class TvRemoteDataSource extends BaseTvRemoteDataSource {
  @override
  Future<ResultsTvModel> getOnTheAirTv({required int pageNum}) async {
    final response = await Dio().get(ApiConstance.onTheAirTvPath(pageNum));
    if (response.statusCode == 200) {
      return ResultsTvModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<ResultsTvModel> getPopularTv({required int pageNum}) async {
    final response = await Dio().get(ApiConstance.popularTvPath(pageNum));
    if (response.statusCode == 200) {
      return ResultsTvModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<ResultsTvModel> getTopRatedTv({required int pageNum}) async {
    final response = await Dio().get(ApiConstance.topRatedTvPath(pageNum: pageNum));
    if (response.statusCode == 200) {
      return ResultsTvModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<TvDetailsModel> getDetailsTv({required int id}) async {
    final response = await Dio().get(ApiConstance.tvDetailsPath(tvId: id));
    if (response.statusCode == 200) {
      return TvDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvDetailsSessionModel>> gettvDetailsSessionInfo(
      {required int tvId, required int sessionNum}) async {
    final response =
        await Dio().get(ApiConstance.tvSessionDetailsPath(sessionNum: sessionNum, tvId: tvId));
    if (response.statusCode == 200) {
      return List<TvDetailsSessionModel>.from(
          (response.data['episodes'] as List).map((e) => TvDetailsSessionModel.fromJson(e)));
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<TvRecommendtionModel>> getTvRecommndition({required tvId}) async {
    final response = await Dio().get(ApiConstance.tvRecommnditionPath(tvId: tvId));
    if (response.statusCode == 200) {
      return List<TvRecommendtionModel>.from(
          (response.data['results'] as List).map((e) => TvRecommendtionModel.fromJson(e)));
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }
}
