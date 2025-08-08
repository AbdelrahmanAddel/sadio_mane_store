import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/get_all_products/domain/usecases/get_all_products_usecase.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_event.dart';
import 'package:sadio_mane_store/features/user/get_all_products/presentation/bloc/get_all_products_state.dart';

class GetAllProductsBloc
    extends Bloc<GetAllProductsEvent, GetAllProductsState> {
  GetAllProductsBloc(this._getAllProductsUsecase)
    : super(
        const GetAllProductsInitialState(hasMoreData: true, productsList: []),
      ) {
    on<GetAllProductsEvent>(_getAllProducts);
    on<LoadMoreProductEvent>(_loadMoreProducts);
  }
  final GetAllProductsUsecase _getAllProductsUsecase;
  int offset = 6;

  FutureOr<void> _getAllProducts(
    GetAllProductsEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    emit(const GetAllProductLoadingState(hasMoreData: true, productsList: []));
    final response = await _getAllProductsUsecase.call(offset: 0);
    response.fold(
      (error) => emit(
        GetAllProductFailureState(
          error,
          hasMoreData: false,
          productsList: const [],
        ),
      ),
      (products) {
        print(products.length);
        emit(
          GetAllProductSuccessState(hasMoreData: true, productsList: products),
        );
      },
    );
  }

  FutureOr<void> _loadMoreProducts(
    LoadMoreProductEvent event,
    Emitter<GetAllProductsState> emit,
  ) async {
    if (!state.hasMoreData) return;
    emit(
      GetAllProductLoadingState(
        hasMoreData: state.hasMoreData,
        productsList: state.productsList,
      ),
    );

    final response = await _getAllProductsUsecase.call(offset: offset);
    response.fold(
      (error) => emit(
        GetAllProductFailureState(
          error,
          hasMoreData: state.hasMoreData,
          productsList: state.productsList,
        ),
      ),
      (products) {
        final newList = [...state.productsList, ...products];
        offset += 6;
        emit(
          GetAllProductSuccessState(
            hasMoreData: products.length < 6,
            productsList: newList,
          ),
        );
      },
    );
  }
}
