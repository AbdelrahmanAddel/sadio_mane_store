import 'package:sadio_mane_store/features/user/category_products/data/models/get_product_by_category_id_model.dart';

sealed class CategoryDetailsState {}

final class GetProductsByCategoryIdLoading extends CategoryDetailsState {}

final class GetProductsByCategoryIdSuccess extends CategoryDetailsState {
  GetProductsByCategoryIdSuccess(this.products);
  final List<ProductsData> products;
}

final class GetProductsByCategoryIdError extends CategoryDetailsState {
  GetProductsByCategoryIdError(this.message);
  final String message;
}
