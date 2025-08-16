part of 'search_bloc.dart';

sealed class SearchEvent {}

final class ChangeSearchTypeEvent extends SearchEvent {
  ChangeSearchTypeEvent({required this.type});
  SearchType type;
}
