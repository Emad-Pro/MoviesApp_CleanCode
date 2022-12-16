import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/app/src/core/utils/enum.dart';
import 'package:movie_app/app/src/search/domain/cases/getSearchDataUseCase.dart';

import '../../../domain/entities/search.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final GetSearchDataUseCase getSearchDataUseCase;
  SearchBloc(this.getSearchDataUseCase) : super(const SearchState()) {
    on<GetSearchDataEvent>(_getSearchDataEvent);
  }

  FutureOr<void> _getSearchDataEvent(GetSearchDataEvent event, Emitter<SearchState> emit) async {
    final result = await getSearchDataUseCase.getData(query: event.query, pageNum: event.pageNum);

    result.fold(
        (l) => emit(
            state.copywith(querySearchMessage: l.message, querySearchState: RequestState.erorr)),
        (r) => emit(state.copywith(querySearchState: RequestState.loaded, querySearchData: r)));
  }
}
