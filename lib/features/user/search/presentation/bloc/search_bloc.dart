import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial(searchType: SearchType.none)) {
    on<ChangeSearchTypeEvent>(_changeSearchType);
  }

  FutureOr<void> _changeSearchType(
    ChangeSearchTypeEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(ChangeSearchType(searchType: event.type));
  }
}
