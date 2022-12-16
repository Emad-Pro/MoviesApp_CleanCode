part of 'search_bloc.dart';

abstract class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}

class GetSearchDataEvent extends SearchEvent {
  final String? query;
  final int? pageNum;

  const GetSearchDataEvent({this.query, this.pageNum});
}
