part of 'movie_details_bloc.dart';

class MovieDetailsState extends Equatable {
  const MovieDetailsState(
      {this.movieRecommnditionmessage = '',
      this.movieRecommnditionList = const [],
      this.movieRecommnditionState = RequestState.loading,
      this.movieDetails,
      this.movieDetailsState = RequestState.loading,
      this.message = ''});

  final MovieDetails? movieDetails;
  final RequestState movieDetailsState;
  final String message;
  final List<Recommndition> movieRecommnditionList;
  final RequestState movieRecommnditionState;
  final String movieRecommnditionmessage;

  MovieDetailsState copyWith({
    MovieDetails? movieDetails,
    RequestState? movieDetailsState,
    String? message,
    List<Recommndition>? movieRecommnditionList,
    RequestState? movieRecommnditionState,
    String? movieRecommnditionmessage,
  }) =>
      MovieDetailsState(
          message: message ?? this.message,
          movieDetails: movieDetails ?? this.movieDetails,
          movieDetailsState: movieDetailsState ?? this.movieDetailsState,
          movieRecommnditionList: movieRecommnditionList ?? this.movieRecommnditionList,
          movieRecommnditionState: movieDetailsState ?? this.movieRecommnditionState,
          movieRecommnditionmessage: movieRecommnditionmessage ?? this.movieRecommnditionmessage);
  @override
  // TODO: implement props
  List<Object?> get props => [movieDetails, movieDetailsState, message];
}
