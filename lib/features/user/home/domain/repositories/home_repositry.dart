import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_product_data_model.dart';

abstract class HomeRepository {
  Future<Either<String, List<BannerProductDataModel>>> getBanners();
}
