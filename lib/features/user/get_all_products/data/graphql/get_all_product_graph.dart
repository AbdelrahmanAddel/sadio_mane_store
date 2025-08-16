class GetAllProductGraph {
  static Map<String, dynamic> getAllProductBody({required int offset}) {
    return {
      'query':
          '''
{
  products(limit: 6, offset: $offset){
    title
    price
    description
    id
  }
}

''',
    };
  }
}
