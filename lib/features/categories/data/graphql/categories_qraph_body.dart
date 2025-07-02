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
}
