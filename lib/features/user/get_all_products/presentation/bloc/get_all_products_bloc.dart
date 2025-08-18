import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/get_all_products/domain/usecases/get_all_products_usecase.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_event.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_state.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc(this._getAllProductsUsecase)
    : super(
        const GetAllProductsInitialState(
          hasMoreData: true,
          productsList: [],
          noMoreData: false,
        ),
      ) {
    on<GetAllProductsViewEvent>(_getAllProducts);
    on<LoadMoreProductEvent>(_loadMoreProducts, transformer: droppable());
  }

  final GetAllProductsUsecase _getAllProductsUsecase;
  int offset = 0;
  final int limit = 6;

  FutureOr<void> _getAllProducts(
    GetAllProductsViewEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    offset = 0;
    emit(
      GetAllProductLoadingState(
        hasMoreData: true,
        productsList: [],
        noMoreData: state.noMoreData,
      ),
    );

    final response = await _getAllProductsUsecase.call(offset: offset);
    response.fold(
      (error) => emit(
        GetAllProductFailureState(
          error,
          hasMoreData: true,
          productsList: const [],
          noMoreData: false,
        ),
      ),
      (products) {
        emit(
          GetAllProductSuccessState(
            hasMoreData: products.length == limit,
            productsList: products,
            noMoreData: products.length != limit,
          ),
        );
      },
    );
  }

  FutureOr<void> _loadMoreProducts(
    LoadMoreProductEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    emit(
      GetAllProductLoadingMoreState(
        hasMoreData: state.hasMoreData,
        productsList: state.productsList,
        noMoreData: state.noMoreData,
      ),
    );

    offset += limit;

    final response = await _getAllProductsUsecase.call(offset: offset);
    response.fold(
      (error) => emit(
        GetAllProductFailureState(
          error,
          hasMoreData: state.hasMoreData,
          productsList: state.productsList,
          noMoreData: false,
        ),
      ),
      (products) {
        final newList = [...state.productsList, ...products];
        emit(
          GetAllProductSuccessState(
            hasMoreData: products.length == limit,
            productsList: newList,
            noMoreData: products.length != limit,
          ),
        );
      },
    );
  }
}
