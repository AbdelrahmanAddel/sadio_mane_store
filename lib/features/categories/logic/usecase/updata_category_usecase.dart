import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/categories/data/model/updata_category_request_model.dart';
import 'package:sadio_mane_store/features/categories/logic/repository/categories_repository.dart';

class UpdataCategoryUsecase {
  UpdataCategoryUsecase(this._categoriesRepository);
  final CategoriesRepository _categoriesRepository;

  Future<Either<String, String>> call(
    UpdateCategoryRequestModel updataCategoryRequestModel,
  ) {
    return _categoriesRepository.updateCategory(updataCategoryRequestModel);
  }
}
