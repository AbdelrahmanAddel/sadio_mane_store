import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_product_data_model.dart';

abstract class HomeRepository {
  Future<Either<String, List<BannerProductDataModel>>> getBanners();
  Future<Either<String, List<CategoriesDataModel>>> getCategories();
  Future<Either<String, List<ProductDataModel>>> getProducts();
}
