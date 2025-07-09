import 'dart:async';

import 'package:flutter/widgets.dart';
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
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  List<String> imagesList = [];

  FutureOr<void> _getProduct(
    GetProductEvent event,
    Emitter<ProductState> emit,
  ) async {
    emit(GetProductsLoadingState());
    final responce = await _getProductUsecase.call();
    if (isClosed) return;
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
        title: titleController.text,
        price: double.parse(priceController.text.toLowerCase()),
        description: descriptionController.text,
        categoryId: event.categoryId,
        images: imagesList,
      ),
    );
    if (isClosed) return;
    responce.fold((error) => emit(AddProductErrorState(error: error)), (
      products,
    ) {
      titleController.clear();
      priceController.clear();
      descriptionController.clear();
      emit(AddProductSuccessState(product: products));
    });
  }
}
