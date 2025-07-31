import 'package:sadio_mane_store/features/admin/categories/data/model/add_categories_request_model.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/updata_category_request_model.dart';

class CategoriesGraphBody {
  CategoriesGraphBody._();

  static Map<String, dynamic> getCategoriesBody() {
    return {
      'query': '''
        {
          categories {
            id
            image
            name
          }
        }
      ''',
    };
  }

  static Map<String, dynamic> addCategoriesBody(
    AddCategoriesRequestModel addCategoriesModel,
  ) {
    return {
      'query': r'''
        mutation addCategories($name: String!, $image: String!) {
          addCategory(
            data: { name: $name, image: $image }
          ) {
            id
            name
            image
          }
        }
      ''',
      'variables': {
        'name': addCategoriesModel.name,
        'image': addCategoriesModel.image,
      },
    };
  }

  static Map<String, dynamic> deleteCategoryBody(int id) {
    return {
      'query': r'''
        mutation deleteCategory($id: ID!) {
          deleteCategory(id: $id)
        }
      ''',
      'variables': {'id': id},
    };
  }

  static Map<String, dynamic> updateCategoryBody(
    UpdateCategoryRequestModel model,
  ) {
    return {
      'query': r'''
        mutation updateCategory($id: ID!, $name: String!, $image: String!) {
          updateCategory(
            id: $id,
            changes: { name: $name, image: $image }
          ) {
            id
          }
        }
      ''',
      'variables': {'id': model.id, 'name': model.name, 'image': model.image},
    };
  }
}
