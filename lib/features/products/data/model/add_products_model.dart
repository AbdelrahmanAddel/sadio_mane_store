class AddProductsModel {
  AddProductsModel({
    required this.title,
    required this.price,
    required this.description,
    required this.categoryId,
    required this.images,
  });

  final String title;
  final double price;
  final String description;
  final int categoryId;
  final List<String> images;
}
