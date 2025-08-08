class BannerGraphs {
  BannerGraphs._();

  static Map<String, dynamic> getBanners() {
    return {
      'query': '''
        {
          products {
            
            title
            
            
            images
    
          }
        }
      ''',
    };
  }

}
