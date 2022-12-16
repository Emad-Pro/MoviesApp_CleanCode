part of 'search_bloc.dart';

class SearchState extends Equatable {
  final Search? querySearchData;
  final RequestState querySearchState;
  final String querySearchMessage;

  const SearchState(
      {this.querySearchData,
      this.querySearchState = RequestState.loading,
      this.querySearchMessage = ''});
  SearchState copywith({
    Search? querySearchData,
    RequestState? querySearchState,
    String? querySearchMessage,
  }) {
    return SearchState(
        querySearchData: querySearchData ?? this.querySearchData,
        querySearchMessage: querySearchMessage ?? this.querySearchMessage,
        querySearchState: querySearchState ?? this.querySearchState);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [querySearchData, querySearchState, querySearchMessage];
}
