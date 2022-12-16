import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app/src/tves/data/models/tvDetailsSessionModel.dart';

import 'package:movie_app/app/src/tves/domain/cases/GetTvOnTheAirUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getRecommnditionUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getTvDetailsUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getTvPopularUseCase.dart';
import 'package:movie_app/app/src/tves/domain/cases/getTvTopRatedUseCase.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetails.dart';
import 'package:movie_app/app/src/tves/domain/entities/tvDetailsSessionInfo.dart';

import '../../../../core/erorr/Failure.dart';
import '../../../../core/utils/enum.dart';
import '../../../domain/cases/getTvSessionsInfoUseCase.dart';
import '../../../domain/entities/tv.dart';
import '../../../domain/entities/tvRecommendtion.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final GetTvOnTheAirUseCase getTvOnTheAirUseCase;
  final GetTvPopularUseCase getTvPopularUseCase;
  final GetTvTopRatedUseCase getTvTopRatedUseCase;
  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetTVSessionDetailsUseCase getTVSessionDetailsUseCase;
  final GetRecommnditionUseCase getRecommnditionUseCase;
  TvBloc(this.getTvOnTheAirUseCase, this.getTvPopularUseCase, this.getTvTopRatedUseCase,
      this.getTvDetailsUseCase, this.getTVSessionDetailsUseCase, this.getRecommnditionUseCase)
      : super(const TvState()) {
    on<GetTvOnTheAirEvent>(_getTvOnTheAirEvent);
    on<GetPopularTvEvent>(_getPopularTvEvent);
    on<GetTopRatedTvEvent>(_getTopRatedTvEvent);
    on<GetTvDdtailsEvent>(_getTvDetailsEvent);
    on<GetTVSessionDetailsEvent>(_getTVSessionDetails);
    on<GetTvRecommnditionEvent>(_getTvRecommndition);
  }

  FutureOr<void> _getTvOnTheAirEvent(GetTvOnTheAirEvent event, Emitter<TvState> emit) async {
    final result = await getTvOnTheAirUseCase.getData(pageNum: event.pageNum);
    result.fold(
        (l) =>
            emit(state.copyWith(tvOnTheAirState: RequestState.erorr, tvOnTheAirMessage: l.message)),
        (r) => emit(state.copyWith(tvOnTheAir: r, tvOnTheAirState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularTvEvent(GetPopularTvEvent event, Emitter<TvState> emit) async {
    final result = await getTvPopularUseCase.getData(pageNum: event.pageNum);
    result.fold(
        (l) =>
            emit(state.copyWith(tvPopularState: RequestState.erorr, tvPopularMessage: l.message)),
        (r) => emit(state.copyWith(tvPopular: r, tvPopularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedTvEvent(GetTopRatedTvEvent event, Emitter<TvState> emit) async {
    Either<Faliure, ResultsTv> result = await getTvTopRatedUseCase.getData(pageNum: event.pageNum);

    result.fold(
        (l) =>
            emit(state.copyWith(tvTopRatedState: RequestState.erorr, tvTopRatedMessage: l.message)),
        (r) {
      return emit(state.copyWith(tvTopRated: r, tvTopRatedState: RequestState.loaded));
    });
  }

  FutureOr<void> _getTvDetailsEvent(GetTvDdtailsEvent event, Emitter<TvState> emit) async {
    final result = await getTvDetailsUseCase.getTvDetails(tvId: event.id);
    result.fold(
        (l) =>
            emit(state.copyWith(tvDetailsMessage: l.message, tvDetailsState: RequestState.erorr)),
        (r) => emit(state.copyWith(tvDetails: r, tvDetailsState: RequestState.loaded)));
  }

  FutureOr<void> _getTVSessionDetails(GetTVSessionDetailsEvent event, Emitter<TvState> emit) async {
    final result = await getTVSessionDetailsUseCase.getTvSessionDetails(
        tvId: event.idTv, sessionNum: event.sessionNum);
    result.fold(
        (l) => emit(state.copyWith(
            tvDetailsSessionInfoMessage: l.message, tvDetailsSessionInfoState: RequestState.erorr)),
        (r) => emit(state.copyWith(
            tvDetailsSessionInfoList: r, tvDetailsSessionInfoState: RequestState.loaded)));
  }

  FutureOr<void> _getTvRecommndition(GetTvRecommnditionEvent event, Emitter<TvState> emit) async {
    final result = await getRecommnditionUseCase.GetRecommndition(tvId: event.idTv);

    result.fold(
        (l) => emit(state.copyWith(
            tvRecommnditionState: RequestState.erorr, tvRecommnditionMessage: l.message)),
        (r) => emit(
            state.copyWith(tvRecommnditionList: r, tvRecommnditionState: RequestState.loaded)));
  }
}
