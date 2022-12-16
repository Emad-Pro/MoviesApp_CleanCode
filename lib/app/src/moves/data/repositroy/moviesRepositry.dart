import 'package:dartz/dartz.dart';

import '../../../core/erorr/Exception.dart';
import '../../../core/erorr/Failure.dart';
import '../../domain/cases/UseCase.dart';
import '../../domain/cases/getRecommnditionMoviesUseCase.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movieDetails.dart';
import '../../domain/entities/MovieResult.dart';
import '../../domain/entities/recomndtion.dart';
import '../../domain/repositroy/base_movies_repositroy.dart';
import '../dataSource/movie_remote_data_Source.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepository(this.baseMovieRemoteDataSource);

  @override
  Future<Either<Faliure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result!);
    } on ServerException catch (failure) {
      return Left(ServerFaliure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, MovieResult>> getPopularMovies({required int pageNum}) async {
    final resualt = await baseMovieRemoteDataSource.getPopulrMovies(pageNum: pageNum);
    try {
      return Right(resualt);
    } on ServerException catch (failure) {
      return Left(ServerFaliure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, MovieResult>> getTopRatedMovies({required int pageNum}) async {
    final result = await baseMovieRemoteDataSource.topRatedMovies(pageNum: pageNum);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFaliure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, MovieResult>> getUpComingMovies({required int pageNum}) async {
    final result = await baseMovieRemoteDataSource.upComingMovies(pageNum: pageNum);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFaliure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, MovieDetails>> getDetailsMovies(MovieDetailsParamter paramter) async {
    final result = await baseMovieRemoteDataSource.getMovieDetails(paramter);
    try {
      return Right(result!);
    } on ServerException catch (failure) {
      return Left(ServerFaliure(failure.erorrMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Faliure, List<Recommndition>>> getRecommnditionMovies(
      RecommnditionParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getRecommnditionMovie(parameters);
    try {
      return Right(result!);
    } on ServerException catch (failure) {
      return Left(ServerFaliure(failure.erorrMessageModel.statusMessage));
    }
  }
}
