import 'package:sadio_mane_store/features/products/data/model/add_products_model.dart';

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

  static Map<String, dynamic> addProductBody(AddProductsModel productModel) {
    return {
      'query': r'''
mutation addProduct ($title:String!,$price:Float!,$description:String!,$categoryId:Float!,$images:[String!]!){
	addProduct(
		data: {
			title: $title
			price: $price
			description: $description
			categoryId: $categoryId
			images: $images
		}
	) {
		title

	}
}

''',
      'variables': {
        'title': productModel.title,
        'price': productModel.price,
        'description': productModel.description,
        'categoryId': productModel.categoryId,
        'images': productModel.images,
      },
    };
  }

  static Map<String, dynamic> deleteProductBody(int id) {
    return {
      'query': r'''
mutation deleteProduct($id:ID!){
	deleteProduct(id: $id)
}


''',
      'variables': {'id': id},
    };
  }
}
