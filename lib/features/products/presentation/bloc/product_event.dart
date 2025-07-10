sealed class ProductEvent {}

final class GetProductEvent extends ProductEvent {}

final class AddProductEvent extends ProductEvent {
  AddProductEvent({required this.categoryId});

  final int categoryId;
}

final class UpdateProductEvent extends ProductEvent {
  UpdateProductEvent({required this.productId});

  final String productId;
}

final class DeleteProductEvent extends ProductEvent {
  DeleteProductEvent({required this.productId});

  final int productId;
}
