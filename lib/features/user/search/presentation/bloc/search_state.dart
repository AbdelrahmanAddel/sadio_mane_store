part of 'search_bloc.dart';

sealed class SearchState {
  SearchState({required this.searchType});

  final SearchType searchType;
}

final class SearchInitial extends SearchState {
  SearchInitial({required super.searchType});
}

final class ChangeSearchType extends SearchState {
  ChangeSearchType({required this.cachedProduct, required super.searchType});
  final List<ProductDataModel> cachedProduct;
}

final class SearchSuccessState extends SearchState {
  SearchSuccessState({required super.searchType, required this.products});
  final List<ProductDataModel> products;
}

final class SearchLoadingState extends SearchState {
  SearchLoadingState({required super.searchType});
}

final class SearchErrorState extends SearchState {
  SearchErrorState({required super.searchType, required this.error});
  final String error;
}
