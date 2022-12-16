import 'package:dartz/dartz.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/movie.dart';
import '../entities/movieDetails.dart';
import '../repositroy/base_movies_repositroy.dart';
import 'UseCase.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetNowPlayingMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Faliure, List<Movie>>> call(NoParameters noParametr) async {
    return await baseMoviesRepository.getNowPlayingMovies();
  }
}
