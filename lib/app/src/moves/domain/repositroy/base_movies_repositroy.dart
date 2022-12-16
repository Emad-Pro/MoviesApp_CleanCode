import 'package:dartz/dartz.dart';

import '../../../core/erorr/Failure.dart';
import '../cases/UseCase.dart';
import '../cases/getRecommnditionMoviesUseCase.dart';
import '../entities/movie.dart';
import '../entities/movieDetails.dart';
import '../entities/MovieResult.dart';
import '../entities/recomndtion.dart';

abstract class BaseMoviesRepository {
  Future<Either<Faliure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Faliure, MovieResult>> getPopularMovies({required int pageNum});
  Future<Either<Faliure, MovieResult>> getTopRatedMovies({required int pageNum});
  Future<Either<Faliure, MovieResult>> getUpComingMovies({required int pageNum});
  Future<Either<Faliure, MovieDetails>> getDetailsMovies(MovieDetailsParamter paramter);
  Future<Either<Faliure, List<Recommndition>>> getRecommnditionMovies(
      RecommnditionParameters parameters);
}
