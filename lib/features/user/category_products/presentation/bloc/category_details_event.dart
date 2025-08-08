sealed class CategoryDetailsEvent {}

final class GetProductsByCategoryIdEvent extends CategoryDetailsEvent {
  GetProductsByCategoryIdEvent( {required this.categoryId});

  final double categoryId;
}
