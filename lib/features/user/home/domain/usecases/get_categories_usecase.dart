import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/user/home/domain/repositories/home_repositry.dart';

class GetHomeCategoriesUsecase {
  GetHomeCategoriesUsecase(this.homeRepository);

  final HomeRepository homeRepository;

  Future<Either<String, List<CategoriesDataModel>>> call() async =>
      homeRepository.getCategories();
}
