class UpdateProductModel {
  UpdateProductModel({
    this.category,
    this.title,
    this.price,
    this.description,
    this.images,
  });
  final String? title;
  final double? price;
  final String? description;
  final List<String>? images;
  final int? category;
}
