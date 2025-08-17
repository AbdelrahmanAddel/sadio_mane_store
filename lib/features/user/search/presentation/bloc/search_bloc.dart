import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/search/domain/usecases/search_by_price_usecase.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this.searchByPriceUsecase)
    : super(SearchInitial(searchType: SearchType.none)) {
    on<ChangeSearchTypeEvent>(_changeSearchType);
    on<SearchByPriceEvent>(_searchByPrice);
  }
  final SearchByPriceUsecase searchByPriceUsecase;

  FutureOr<void> _changeSearchType(
    ChangeSearchTypeEvent event,
    Emitter<SearchState> emit,
  ) {
    emit(ChangeSearchType(searchType: event.type));
  }

  FutureOr<void> _searchByPrice(
    SearchByPriceEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchByPriceLoadingState(searchType: state.searchType));
    try {
      final response = await searchByPriceUsecase.call(
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
      );
      response.fold(
        (failure) {
          emit(
            SearchByPriceErrorState(
              searchType: state.searchType,
              error: failure,
            ),
          );
        },
        (products) {
          emit(
            SearchByPriceSuccessState(
              searchType: state.searchType,
              products: products.data!.products,
            ),
          );
        },
      );
    } catch (error) {
      debugPrint(error.toString());
      emit(
        SearchByPriceErrorState(
          searchType: state.searchType,
          error: error.toString(),
        ),
      );
    }
  }
}
