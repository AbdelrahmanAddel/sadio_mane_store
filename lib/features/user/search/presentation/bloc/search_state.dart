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

final class SearchByPriceSuccessState extends SearchState {
  SearchByPriceSuccessState({
    required super.searchType,
    required this.products,
  });
  final List<ProductDataModel> products;
}

final class SearchByPriceLoadingState extends SearchState {
  SearchByPriceLoadingState({required super.searchType});
}

final class SearchByPriceErrorState extends SearchState {
  SearchByPriceErrorState({required super.searchType, required this.error});
  final String error;
}
