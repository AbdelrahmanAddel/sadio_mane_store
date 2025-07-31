import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

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

final class AddProductLoadingState extends ProductState {}

final class AddProductSuccessState extends ProductState {
  AddProductSuccessState({required this.product});

  final String product;
}

final class AddProductErrorState extends ProductState {
  AddProductErrorState({required this.error});
  final String error;
}

final class DeleteProductLoadingState extends ProductState {}

final class DeleteProductFailureState extends ProductState {
  DeleteProductFailureState({required this.error});
  final String error;
}

final class DeleteProductSuccessState extends ProductState {
  DeleteProductSuccessState({required this.message});
  final String message;
}

final class UpdateProductLoadingState extends ProductState {}

final class UpdateProductFailureState extends ProductState {
  UpdateProductFailureState({required this.errorMessage});
  final String errorMessage;
}

final class UpdateProductSuccessState extends ProductState {
  UpdateProductSuccessState({required this.successMessage});
  final String successMessage;
}
