import 'package:dartz/dartz.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/movie.dart';
import '../entities/movieDetails.dart';
import '../repositroy/base_movies_repositroy.dart';
import 'UseCase.dart';
import '../entities/MovieResult.dart';

class GetUpComingMoviesUseCase {
  final BaseMoviesRepository baseMoviesRepository;

  GetUpComingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Faliure, MovieResult>> getData({required int pageNum}) async {
    return await baseMoviesRepository.getUpComingMovies(pageNum: pageNum);
  }
}
