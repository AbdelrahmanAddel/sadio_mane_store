sealed class ProductEvent {}

final class GetProductEvent extends ProductEvent {}

final class AddProductEvent extends ProductEvent {
  AddProductEvent({required this.categoryId});

  final int categoryId;
}

final class EditProductEvent extends ProductEvent {}

final class DeleteProductEvent extends ProductEvent {}
