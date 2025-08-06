import 'package:dartz/dartz.dart';
import 'package:sadio_mane_store/features/user/category_details/data/models/category_details_model.dart';

abstract class CategoryDetailsRepository {
  Future<Either<String, List<CategoriesDetailsDataModel>>> getCategoryDetails(
    String id,
  );
}