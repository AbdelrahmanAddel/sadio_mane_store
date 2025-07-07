import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/products/data/model/add_products_model.dart';
import 'package:sadio_mane_store/features/products/logic/usecase/add_product_usecase.dart';
import 'package:sadio_mane_store/features/products/logic/usecase/get_product_usecase.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_event.dart';
import 'package:sadio_mane_store/features/products/presentation/bloc/product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc(this._getProductUsecase, this._addProductUsecase)
    : super(GetProductsLoadingState()) {
    on<GetProductEvent>(_getProduct);
    on<AddProductEvent>(_addProduct);
  }
  final GetProductUsecase _getProductUsecase;
  final AddProductUsecase _addProductUsecase;

  FutureOr<void> _getProduct(
    GetProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(GetProductsLoadingState());
    final responce = await _getProductUsecase.call();
    responce.fold(
      (error) => emit(GetProductsErrorState(error: error)),
      (products) => emit(GetProductsSuccessState(product: products)),
    );
  }

  FutureOr<void> _addProduct(
    AddProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(AddProductLoadingState());
    final responce = await _addProductUsecase.call(
      AddProductsModel(
        title: 'Sadio',
        price: 2000,
        description: 'فحل',
        categoryId: 1,
        images: [
          'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQR_2kiBARDkwoFncmX-8lSoia1ROdC4k6c0pyZWy2dE5fyF6UTNVezsCoRo5aVolW-YKQb7b-t12kQwlRzjVYumg',
        ],
      ),
    );
    responce.fold(
      (error) => emit(AddProductErrorState(error: error)),
      (products) => emit(AddProductSuccessState(product: products)),
    );
  }
}
