part of 'search_bloc.dart';

sealed class SearchState {
  SearchState({required this.searchType});

  final SearchType searchType;
}

final class SearchInitial extends SearchState {
  SearchInitial({required super.searchType});
}

final class ChangeSearchType extends SearchState {
  ChangeSearchType({required super.searchType});
}
