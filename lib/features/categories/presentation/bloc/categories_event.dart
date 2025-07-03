sealed class CategoriesEvent {}

final class GetCategoriesEvent extends CategoriesEvent {}

final class AddCategoriesEvent extends CategoriesEvent {
  AddCategoriesEvent({required this.imageUrl});

  final String imageUrl;
}
