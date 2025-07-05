import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/categories/logic/repository/categories_repository.dart';

class DeleteCategoryUsecase {
  DeleteCategoryUsecase(this._categoriesRepository);
  final CategoriesRepository _categoriesRepository;

  Future<Either<String, String>> call(int id) {
    return _categoriesRepository.deleteCategory(id);
  }
}
