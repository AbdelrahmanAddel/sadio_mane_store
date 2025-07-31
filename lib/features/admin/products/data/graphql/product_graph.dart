import 'package:sadio_mane_store/features/admin/products/data/model/add_products_model.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/update_product_model.dart';

class ProductGraph {
  ProductGraph._();

  /// 📦 Query: Get all products
  static Map<String, dynamic> getProductsBody() {
    return {
      'query': '''
        {
          products {
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

  /// ➕ Mutation: Add new product
  static Map<String, dynamic> addProductBody(AddProductsModel productModel) {
    return {
      'query': r'''
        mutation addProduct(
          $title: String!,
          $price: Float!,
          $description: String!,
          $categoryId: Float!,
          $images: [String!]!
        ) {
          addProduct(
            data: {
              title: $title,
              price: $price,
              description: $description,
              categoryId: $categoryId,
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

  /// ❌ Mutation: Delete product
  static Map<String, dynamic> deleteProductBody(int id) {
    return {
      'query': r'''
        mutation deleteProduct($id: ID!) {
          deleteProduct(id: $id)
        }
      ''',
      'variables': {'id': id},
    };
  }

  /// 🔄 Mutation: Update product
  static Map<String, dynamic> updateProductBody(
    int productId,
    UpdateProductModel updateProduct,
  ) {
    return {
      'query': r'''
        mutation updateProduct(
          $id: ID!,
          $title: String!,
          $price: Float!,
          $images: [String!],
          $description: String!
        ) {
          updateProduct(
            id: $id,
            changes: {
              title: $title,
              price: $price,
              images: $images,
              description: $description
            }
          ) {
            id
          }
        }
      ''',
      'variables': {
        'id': productId,
        'title': updateProduct.title,
        'price': updateProduct.price,
        'images': updateProduct.images,
        'description': updateProduct.description,
      },
    };
  }
}
