import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_product_data_model.dart';
import 'package:sadio_mane_store/features/user/home/domain/repositories/home_repositry.dart';

class GetBannersUsecase {
  GetBannersUsecase(this.homeRepository);

  final HomeRepository homeRepository;

  Future<Either<String, List<BannerProductDataModel>>> call() async =>
      homeRepository.getBanners();
}
