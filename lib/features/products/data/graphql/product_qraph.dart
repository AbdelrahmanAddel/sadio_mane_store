class ProductQraph {
  ProductQraph._();
  static Map<String, dynamic> getProductsBody() {
    return {
      'query': '''
{
  products{
		id
    title
    price
		description
		images
		category {
			id
			name

		}
  }
}
''',
    };
  }
}
