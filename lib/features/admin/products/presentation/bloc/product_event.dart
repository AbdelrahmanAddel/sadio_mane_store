sealed class ProductEvent {}

final class GetProductEvent extends ProductEvent {}

final class AddProductEvent extends ProductEvent {
  AddProductEvent(this.imagesList, {required this.categoryId});

  final int categoryId;
  final List<String> imagesList;
}

final class UpdateProductEvent extends ProductEvent {
  UpdateProductEvent(this.images, {required this.productId});
  final List<String> images;
  final String productId;
}

final class DeleteProductEvent extends ProductEvent {
  DeleteProductEvent({required this.productId});

  final int productId;
}
