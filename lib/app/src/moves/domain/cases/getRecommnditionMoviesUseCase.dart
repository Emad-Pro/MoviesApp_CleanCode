import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/movie.dart';
import '../entities/movieDetails.dart';
import '../entities/recomndtion.dart';
import '../repositroy/base_movies_repositroy.dart';
import 'UseCase.dart';

class GetRecommnditionMovieUseCase
    extends BaseUseCase<List<Recommndition>, RecommnditionParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommnditionMovieUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Faliure, List<Recommndition>>> call(RecommnditionParameters parametrs) async {
    return await baseMoviesRepository.getRecommnditionMovies(parametrs);
  }
}

class RecommnditionParameters extends Equatable {
  final int id;

  const RecommnditionParameters({required this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}
