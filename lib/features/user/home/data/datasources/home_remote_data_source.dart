import 'package:sadio_mane_store/features/user/home/data/datasources/home_api_service.dart';
import 'package:sadio_mane_store/features/user/home/data/graphql/banner_graphs.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/banner_model.dart';

class HomeRemoteDataSource {
  HomeRemoteDataSource(this.homeApiService);

  final HomeApiService homeApiService;

  Future<BannerModel> getBanners() async =>
      homeApiService.getBanners(BannerGraphs.getBanners());
}
