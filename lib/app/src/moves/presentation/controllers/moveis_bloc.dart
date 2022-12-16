import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/enum.dart';
import '../../domain/cases/UseCase.dart';
import '../../domain/cases/getNowPlayingMoviesUseCase.dart';
import '../../domain/cases/getPopularMoviesUseCase.dart';
import '../../domain/cases/getTopRatedMoviesUseCases.dart';
import '../../domain/cases/getUpCommingMoviesUseCases.dart';
import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetUpComingMoviesUseCase getUpComingMoviesUseCase;

  MoviesBloc(
    this.getNowPlayingMoviesUseCase,
    this.getPopularMoviesUseCase,
    this.getTopRatedMoviesUseCase,
    this.getUpComingMoviesUseCase,
  ) : super(
          const MoviesState(),
        ) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetUpCommingMoviesEvent>(_getUpComingMovies);
  }

  FutureOr<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    return await result.fold(
      (l) => emit(state.copyWith(
        nowPlayingState: RequestState.erorr,
        nowPlayingMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        nowPlayingMovies: r,
        nowPlayingState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopularMoviesUseCase.getData(pageNum: event.pageNum);
    return await result.fold(
      (l) => emit(state.copyWith(
        getPopularState: RequestState.erorr,
        getPopularMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        getPopularMovies: r,
        getPopularState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedMoviesUseCase.getData(pageNum: event.pageNum);
    return await result.fold(
      (l) => emit(state.copyWith(
        getTopRatedState: RequestState.erorr,
        getTopRatedMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        getTopRatedMovies: r,
        getTopRatedState: RequestState.loaded,
      )),
    );
  }

  FutureOr<void> _getUpComingMovies(
      GetUpCommingMoviesEvent event, Emitter<MoviesState> emit) async {
    final result = await getUpComingMoviesUseCase.getData(pageNum: event.pageNum);
    return await result.fold(
      (l) => emit(state.copyWith(
        getUpComingState: RequestState.erorr,
        getUpComingMessage: l.message,
      )),
      (r) => emit(state.copyWith(
        getUpComingMovies: r,
        getUpComingState: RequestState.loaded,
      )),
    );
  }
}
