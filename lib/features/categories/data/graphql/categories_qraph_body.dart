import 'package:sadio_mane_store/features/categories/data/model/add_categories_request_model.dart';

class CategoriesQraphBody {
  CategoriesQraphBody();

  static Map<String, dynamic> getCategoriesBody() {
    return {
      'query': '''
{
  categories{
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
mutation addCategories($name:String! ,$image:String!){
	addCategory(
		data: { name:$name,
      image: $image }
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
      mutation deleteProduct($id: ID!) {
        deleteCategory(id: $id)
      }
    ''',
      'variables': {'id': id},
    };
  }
}
