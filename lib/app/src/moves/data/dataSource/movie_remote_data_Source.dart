import 'package:dio/dio.dart';

import '../../../core/erorr/Exception.dart';
import '../../../core/network/api_Constance.dart';
import '../../../core/network/erorrMessageModel.dart';
import '../../domain/cases/UseCase.dart';
import '../../domain/cases/getRecommnditionMoviesUseCase.dart';
import '../../domain/entities/recomndtion.dart';
import '../models/movieDetailsModel.dart';
import '../models/movieModel.dart';
import '../models/movieResultModel.dart';
import '../models/recommditionModel.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>?> getNowPlayingMovies();
  Future<MovieResultModel> getPopulrMovies({required int? pageNum});
  Future<MovieResultModel> topRatedMovies({required int? pageNum});
  Future<MovieResultModel> upComingMovies({required int? pageNum});
  Future<MovieDetailsModel?> getMovieDetails(MovieDetailsParamter movieDetailsParamter);
  Future<List<Recommndition>?> getRecommnditionMovie(
      RecommnditionParameters recommnditionParameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>?> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data['results'] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    }
    {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieResultModel> getPopulrMovies({required int? pageNum}) async {
    final response = await Dio().get(ApiConstance.getPouplerMoviesPath(pageNum: pageNum!));
    if (response.statusCode == 200) {
      return MovieResultModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieResultModel> topRatedMovies({required int? pageNum}) async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath(pageNum: pageNum!));
    if (response.statusCode == 200) {
      return MovieResultModel.fromJson(response.data);
    } else {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieResultModel> upComingMovies({required int? pageNum}) async {
    final response = await Dio().get(ApiConstance.upComingPath(pageNum: pageNum!));

    if (response.statusCode == 200) {
      return MovieResultModel.fromJson(response.data);
    }
    {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParamter movieDetailsParamter) async {
    final response = await Dio().get(ApiConstance.movieDetailsPath(movieDetailsParamter.movieId));

    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    }
    {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<Recommndition>> getRecommnditionMovie(
    RecommnditionParameters recommnditionParameters,
  ) async {
    final response =
        await Dio().get(ApiConstance.recommditionMoviePath(recommnditionParameters.id));

    if (response.statusCode == 200) {
      return List<Recommndition>.from(
        (response.data['results'] as List).map(
          (e) => RecommditionModel.fromJson(e),
        ),
      );
    }
    {
      throw ServerException(erorrMessageModel: ErorrMessageModel.fromJson(response.data));
    }
  }
}
