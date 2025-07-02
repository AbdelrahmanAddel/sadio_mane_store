class GetCategoriesQraphBody {
  GetCategoriesQraphBody();

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
