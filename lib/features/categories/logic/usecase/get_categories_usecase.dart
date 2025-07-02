import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/categories/data/model/categories_responce_model.dart';
import 'package:sadio_mane_store/features/categories/logic/repository/categories_repository.dart';

class GetCategoriesUsecase {
  GetCategoriesUsecase( this.getCategoriesRepository);
  CategoriesRepository getCategoriesRepository;
  Future<Either<String, GetCategoriesResponceModel>> call() {
    return getCategoriesRepository.getCategories();
  }
}
