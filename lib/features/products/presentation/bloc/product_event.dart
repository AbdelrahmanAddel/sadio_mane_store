sealed class ProductEvent {}

final class GetProductEvent extends ProductEvent {}

final class AddProductEvent extends ProductEvent {}

final class EditProductEvent extends ProductEvent {}

final class DeleteProductEvent extends ProductEvent {}
