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
          }
        }

''',
    };
  }
}
