import 'package:dartz/dartz.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/movieDetails.dart';
import '../repositroy/base_movies_repositroy.dart';
import 'UseCase.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParamter> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDetailsUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Faliure, MovieDetails>> call(MovieDetailsParamter parametrs) async {
    return await baseMoviesRepository.getDetailsMovies(parametrs);
  }
}
