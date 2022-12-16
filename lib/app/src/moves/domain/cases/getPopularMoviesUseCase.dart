import 'package:dartz/dartz.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/movie.dart';
import '../entities/movieDetails.dart';
import '../entities/MovieResult.dart';
import '../repositroy/base_movies_repositroy.dart';
import 'UseCase.dart';

class GetPopularMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Faliure, MovieResult>> getData({required int pageNum}) async {
    return await baseMoviesRepository.getPopularMovies(pageNum: pageNum);
  }
}
