import 'package:sadio_mane_store/features/products/data/model/update_product_model.dart';

sealed class ProductEvent {}

final class GetProductEvent extends ProductEvent {}

final class AddProductEvent extends ProductEvent {
  AddProductEvent({required this.categoryId});

  final int categoryId;
}

final class UpdateProductEvent extends ProductEvent {
  UpdateProductEvent(this.id, {required this.updateProductModel});
  final UpdateProductModel updateProductModel;
  final int id;
}

final class DeleteProductEvent extends ProductEvent {
  DeleteProductEvent({required this.productId});

  final int productId;
}
