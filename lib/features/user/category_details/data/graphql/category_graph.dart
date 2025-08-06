import 'dart:ffi';

class CategoryGraph {
  static Map<String, dynamic> categoryDetails(Float id) {
    return {
      'query': r'''
  query CategoryDetails($id: Float!) {
	products( categoryId: $id) {
		title
		price
        images

	}
}

''',
      'variable': {'id': id},
    };
  }
}
