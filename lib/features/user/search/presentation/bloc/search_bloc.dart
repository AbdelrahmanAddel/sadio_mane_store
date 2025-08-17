import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/search/domain/usecases/search_by_price_usecase.dart';
import 'package:sadio_mane_store/features/user/search/domain/usecases/search_by_title_usecase.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc(this._searchByPriceUsecase, this._searchByTitleUsecase)
    : super(SearchInitial(searchType: SearchType.none)) {
    on<ChangeSearchTypeEvent>(_changeSearchType);
    on<SearchByPriceEvent>(_searchByPrice);
    on<SearchByTitleEvent>(_searchByTitle);
  }
  final SearchByPriceUsecase _searchByPriceUsecase;
  final SearchByTitleUsecase _searchByTitleUsecase;
  List<ProductDataModel> _cachedProduct = [];

  FutureOr<void> _changeSearchType(
    ChangeSearchTypeEvent event,
    Emitter<SearchState> emit,
  ) {
    if (state.searchType != event.type) {
      emit(
        ChangeSearchType(searchType: event.type, cachedProduct: _cachedProduct),
      );
    }
  }

  FutureOr<void> _searchByPrice(
    SearchByPriceEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoadingState(searchType: state.searchType));
    try {
      final response = await _searchByPriceUsecase.call(
        minPrice: event.minPrice,
        maxPrice: event.maxPrice,
      );
      response.fold(
        (failure) {
          emit(SearchErrorState(searchType: state.searchType, error: failure));
        },
        (products) {
          _cachedProduct = products.data?.products ?? [];

          emit(
            SearchSuccessState(
              searchType: state.searchType,
              products: products.data!.products,
            ),
          );
        },
      );
    } catch (error) {
      debugPrint(error.toString());
      emit(
        SearchErrorState(searchType: state.searchType, error: error.toString()),
      );
    }
  }

  FutureOr<void> _searchByTitle(
    SearchByTitleEvent event,
    Emitter<SearchState> emit,
  ) async {
    emit(SearchLoadingState(searchType: state.searchType));
    final response = await _searchByTitleUsecase.call(title: event.title);
    response.fold(
      (error) =>
          emit(SearchErrorState(searchType: state.searchType, error: error)),
      (products) {
        _cachedProduct = products.data?.products ?? [];

        emit(
          SearchSuccessState(
            searchType: state.searchType,
            products: products.data?.products ?? [],
          ),
        );
      },
    );
  }
}
