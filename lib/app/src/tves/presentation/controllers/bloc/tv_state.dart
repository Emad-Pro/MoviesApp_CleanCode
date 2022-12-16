part of 'tv_bloc.dart';

class TvState extends Equatable {
  final ResultsTv? tvOnTheAir;
  final RequestState tvOnTheAirState;
  final String tvOnTheAirMessage;
  final ResultsTv? tvTopRated;
  final RequestState tvTopRatedState;
  final String tvTopRatedMessage;
  final ResultsTv? tvPopular;
  final RequestState tvPopularState;
  final String tvPopularMessage;
  final TvDetails? tvDetails;
  final RequestState tvDetailsState;
  final String tvDetailsMessage;
  final List<TVDetailsSessionInfo> tvDetailsSessionInfoList;
  final RequestState tvDetailsSessionInfoState;
  final String tvDetailsSessionInfoMessage;
  final List<TvRecommendtion> tvRecommnditionList;
  final RequestState tvRecommnditionState;
  final String tvRecommnditionMessage;
  const TvState({
    this.tvOnTheAir,
    this.tvOnTheAirState = RequestState.loading,
    this.tvOnTheAirMessage = '',
    this.tvTopRated,
    this.tvTopRatedState = RequestState.loading,
    this.tvTopRatedMessage = '',
    this.tvPopular,
    this.tvPopularState = RequestState.loading,
    this.tvPopularMessage = '',
    this.tvDetails,
    this.tvDetailsState = RequestState.loading,
    this.tvDetailsMessage = '',
    this.tvDetailsSessionInfoList = const [],
    this.tvDetailsSessionInfoState = RequestState.loading,
    this.tvDetailsSessionInfoMessage = '',
    this.tvRecommnditionList = const [],
    this.tvRecommnditionState = RequestState.loading,
    this.tvRecommnditionMessage = '',
  });
  TvState copyWith({
    ResultsTv? tvOnTheAir,
    RequestState? tvOnTheAirState,
    String? tvOnTheAirMessage,
    ResultsTv? tvTopRated,
    RequestState? tvTopRatedState,
    String? tvTopRatedMessage,
    ResultsTv? tvPopular,
    RequestState? tvPopularState,
    String? tvPopularMessage,
    TvDetails? tvDetails,
    RequestState? tvDetailsState,
    String? tvDetailsMessage,
    List<TVDetailsSessionInfo>? tvDetailsSessionInfoList,
    RequestState? tvDetailsSessionInfoState,
    String? tvDetailsSessionInfoMessage,
    List<TvRecommendtion>? tvRecommnditionList,
    RequestState? tvRecommnditionState,
    String? tvRecommnditionMessage,
  }) {
    return TvState(
      tvOnTheAir: tvOnTheAir ?? this.tvOnTheAir,
      tvOnTheAirMessage: tvOnTheAirMessage ?? this.tvOnTheAirMessage,
      tvOnTheAirState: tvOnTheAirState ?? this.tvOnTheAirState,
      tvTopRated: tvTopRated ?? this.tvTopRated,
      tvTopRatedState: tvTopRatedState ?? this.tvTopRatedState,
      tvTopRatedMessage: tvTopRatedMessage ?? this.tvTopRatedMessage,
      tvPopular: tvPopular ?? this.tvPopular,
      tvPopularState: tvPopularState ?? this.tvPopularState,
      tvPopularMessage: tvPopularMessage ?? this.tvPopularMessage,
      tvDetails: tvDetails ?? this.tvDetails,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      tvDetailsSessionInfoList: tvDetailsSessionInfoList ?? this.tvDetailsSessionInfoList,
      tvDetailsSessionInfoMessage: tvDetailsSessionInfoMessage ?? this.tvDetailsSessionInfoMessage,
      tvDetailsSessionInfoState: tvDetailsSessionInfoState ?? this.tvDetailsSessionInfoState,
      tvRecommnditionList: tvRecommnditionList ?? this.tvRecommnditionList,
      tvRecommnditionMessage: tvRecommnditionMessage ?? this.tvRecommnditionMessage,
      tvRecommnditionState: tvRecommnditionState ?? this.tvRecommnditionState,
    );
  }

  @override
  List<Object?> get props => [
        tvOnTheAir,
        tvOnTheAirState,
        tvOnTheAirMessage,
        tvPopularMessage,
        tvPopularState,
        tvPopular,
        tvTopRatedMessage,
        tvTopRatedState,
        tvTopRated,
        tvDetails,
        tvDetailsState,
        tvDetailsMessage,
        tvDetailsSessionInfoList,
        tvDetailsSessionInfoMessage,
        tvDetailsSessionInfoState,
        tvRecommnditionList,
        tvRecommnditionMessage,
        tvRecommnditionState,
      ];
}
