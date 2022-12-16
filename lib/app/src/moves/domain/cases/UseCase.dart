import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../core/erorr/Failure.dart';
import '../entities/movie.dart';

abstract class BaseUseCase<T, MovieDetailsParamter> {
  Future<Either<Faliure, T>> call(MovieDetailsParamter parametrs);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [];
}

class MovieDetailsParamter extends Equatable {
  final int movieId;
  final int? pageNum;

  const MovieDetailsParamter({required this.movieId, this.pageNum});

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
