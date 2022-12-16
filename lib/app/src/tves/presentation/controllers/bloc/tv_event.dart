part of 'tv_bloc.dart';

abstract class TvEvent extends Equatable {
  const TvEvent();

  @override
  List<Object> get props => [];
}

class GetTvOnTheAirEvent extends TvEvent {
  final int pageNum;

  const GetTvOnTheAirEvent({required this.pageNum});
}

class GetPopularTvEvent extends TvEvent {
  final int pageNum;

  const GetPopularTvEvent({required this.pageNum});
}

class GetTopRatedTvEvent extends TvEvent {
  final int pageNum;

  const GetTopRatedTvEvent({required this.pageNum});
}

class GetTvDdtailsEvent extends TvEvent {
  final int id;

  const GetTvDdtailsEvent(this.id);
}

class GetTVSessionDetailsEvent extends TvEvent {
  final int idTv;
  final int sessionNum;

  const GetTVSessionDetailsEvent({required this.idTv, required this.sessionNum});
}

class GetTvRecommnditionEvent extends TvEvent {
  final int idTv;

  const GetTvRecommnditionEvent(this.idTv);
}
