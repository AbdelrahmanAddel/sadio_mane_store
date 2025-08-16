part of 'search_bloc.dart';

sealed class SearchEvent {}

final class ChangeSearchTypeEvent extends SearchEvent {
  ChangeSearchTypeEvent({required this.type});
  SearchType type;
}

final class SearchByPriceEvent extends SearchEvent {
  SearchByPriceEvent({required this.minPrice, required this.maxPrice});
  int minPrice;
  int maxPrice;
}
