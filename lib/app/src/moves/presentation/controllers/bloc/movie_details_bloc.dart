import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enum.dart';
import '../../../domain/cases/UseCase.dart';
import '../../../domain/cases/getMovieDetailsUseCase.dart';
import '../../../domain/cases/getRecommnditionMoviesUseCase.dart';
import '../../../domain/entities/movieDetails.dart';
import '../../../domain/entities/recomndtion.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommnditionMovieUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommenditonEvent>(_getMovieRecommnditonEvent);
  }
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommnditionMovieUseCase getRecommnditionMovieUseCase;
  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getMovieDetailsUseCase(
      MovieDetailsParamter(
        movieId: event.id,
      ),
    );
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestState.erorr,
          message: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommnditonEvent(
      GetMovieRecommenditonEvent event, Emitter<MovieDetailsState> emit) async {
    final result = await getRecommnditionMovieUseCase(
      RecommnditionParameters(id: event.id),
    );
    result.fold(
      (l) => emit(state.copyWith(
          movieRecommnditionState: RequestState.erorr, movieRecommnditionmessage: l.message)),
      (r) => emit(
        state.copyWith(
          movieRecommnditionList: r,
          movieRecommnditionState: RequestState.loaded,
        ),
      ),
    );
  }
}
