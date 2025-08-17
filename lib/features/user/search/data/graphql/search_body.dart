class SearchBody {
  static Map<String, dynamic> searchByPriceBody({
    required int minPrice,
    required int maxPrice,
  }) {
    return {
      'query':
          '''
        {
          products(price_min: $minPrice, price_max: $maxPrice) {
            title
            price
            images
          }
        }

        ''',
    };
  }

  static Map<String, dynamic> searchByProductTitle({required String title}) {
    return {
      'query': '''
          {
      products(title: "$title"){
          title
          price
          images
        }
      } 
          ''',
    };
  }
}
