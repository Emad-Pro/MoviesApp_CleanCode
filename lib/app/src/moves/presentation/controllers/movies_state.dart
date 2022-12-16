import 'package:equatable/equatable.dart';

import '../../../core/utils/enum.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/MovieResult.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final MovieResult? getPopularMovies;
  final RequestState getPopularState;
  final String getPopularMessage;
  final MovieResult? getTopRatedMovies;
  final RequestState getTopRatedState;
  final String getTopRatedMessage;
  final MovieResult? getUpComingMovies;
  final RequestState getUpComingState;
  final String getUpComingMessage;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMessage = '',
    this.nowPlayingState = RequestState.loading,
    this.getPopularMovies,
    this.getPopularMessage = '',
    this.getPopularState = RequestState.loading,
    this.getTopRatedMovies,
    this.getTopRatedMessage = '',
    this.getTopRatedState = RequestState.loading,
    this.getUpComingMovies,
    this.getUpComingMessage = '',
    this.getUpComingState = RequestState.loading,
  });
  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    MovieResult? getPopularMovies,
    RequestState? getPopularState,
    String? getPopularMessage,
    MovieResult? getTopRatedMovies,
    RequestState? getTopRatedState,
    String? getTopRatedMessage,
    MovieResult? getUpComingMovies,
    RequestState? getUpComingState,
    String? getUpComingMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      getPopularMessage: getPopularMessage ?? this.getPopularMessage,
      getPopularMovies: getPopularMovies ?? this.getPopularMovies,
      getPopularState: getPopularState ?? this.getPopularState,
      getTopRatedMessage: getTopRatedMessage ?? this.getTopRatedMessage,
      getTopRatedMovies: getTopRatedMovies ?? this.getTopRatedMovies,
      getTopRatedState: getTopRatedState ?? this.getTopRatedState,
      getUpComingMessage: getUpComingMessage ?? this.getUpComingMessage,
      getUpComingMovies: getUpComingMovies ?? this.getUpComingMovies,
      getUpComingState: getUpComingState ?? this.getUpComingState,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingMovies,
        nowPlayingState,
        nowPlayingMessage,
        getPopularMovies,
        getPopularState,
        getPopularMessage,
        getTopRatedMovies,
        getTopRatedState,
        getTopRatedMessage,
        getUpComingMovies,
        getUpComingState,
        getUpComingMessage,
      ];
}
