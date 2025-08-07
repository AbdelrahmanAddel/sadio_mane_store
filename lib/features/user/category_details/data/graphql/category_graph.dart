class CategoryGraph {
  static Map<String, dynamic> getProductByCategory(double id) {
    return {
      'query': r'''
        query CategoryDetails($id: Float!) {
          products(categoryId: $id) {
            title
            price
            images
          }
        }
      ''',
      'variables': {'id': id},
    };
  }
}
