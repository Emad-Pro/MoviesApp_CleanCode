import 'package:dartz/dartz.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/movie.dart';
import '../entities/movieDetails.dart';
import '../entities/MovieResult.dart';
import '../repositroy/base_movies_repositroy.dart';
import 'UseCase.dart';

class GetTopRatedMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetTopRatedMoviesUseCase(this.baseMoviesRepository);

  Future<Either<Faliure, MovieResult>> getData({required int pageNum}) async {
    return await baseMoviesRepository.getTopRatedMovies(pageNum: pageNum);
  }
}
