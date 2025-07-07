import 'package:sadio_mane_store/features/products/data/model/products_model.dart';

sealed class ProductState {}

final class GetProductsLoadingState extends ProductState {}

final class GetProductsSuccessState extends ProductState {
  GetProductsSuccessState({required this.product});

  final ProductsModel product;
}

final class GetProductsErrorState extends ProductState {
  GetProductsErrorState({required this.error});
  final String error;
}

final class AddProductState extends ProductState {}

final class EditProductState extends ProductState {}

final class DeleteProductState extends ProductState {}
