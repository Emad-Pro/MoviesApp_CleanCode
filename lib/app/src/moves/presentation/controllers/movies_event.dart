import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
  @override
  List<Object> get props => [];
}

class GetNowPlayingMoviesEvent extends MoviesEvent {}

class GetPopularMoviesEvent extends MoviesEvent {
  final int pageNum;

  const GetPopularMoviesEvent({required this.pageNum});
}

class GetTopRatedMoviesEvent extends MoviesEvent {
  final int pageNum;

  const GetTopRatedMoviesEvent({required this.pageNum});
}

class GetUpCommingMoviesEvent extends MoviesEvent {
  final int pageNum;

  const GetUpCommingMoviesEvent({required this.pageNum});
}
