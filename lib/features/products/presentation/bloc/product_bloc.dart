import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/products/logic/usecase/get_product_usecase.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_event.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._getProductUsecase) : super(GetProductsLoadingState()) {
    on<GetProductEvent>(_getProduct);
  }
  final GetProductUsecase _getProductUsecase;

  FutureOr<void> _getProduct(
    GetProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    final responce = await _getProductUsecase.call();
    responce.fold(
      (error) => emit(GetProductsErrorState(error: error)),
      (products) => emit(GetProductsSuccessState(product: products)),
    );
  }
}
