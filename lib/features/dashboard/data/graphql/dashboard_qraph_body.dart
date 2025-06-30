class DashboardQraphBody {
  DashboardQraphBody._();
  static Map<String, dynamic> getProductsTotalLength() {
    return {
      'query': r''' {
  products{
		id 
		}
  }


''',
    };
  }

  static Map<String, dynamic> getUsersTotalNumber() {
    return {
      'query': '''
{
  users{
		id

  }
}

''',
    };
  }

  static Map<String, dynamic> getCategoriesTotalNumber() {
    return {
      'query': '''
{
  categories{
    id
  }
}

''',
    };
  }
}
