import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/category_details/data/models/category_details_model.dart';
import 'package:sadio_mane_store/features/user/category_details/domain/repositories/category_details_repository.dart';

class GetCategoryDetailsUsecase {
  GetCategoryDetailsUsecase(this.repository);
  final CategoryDetailsRepository repository;

  Future<Either<String, List<CategoriesDetailsDataModel>>> call(String id) async {
    return repository.getCategoryDetails(id);
  }
}