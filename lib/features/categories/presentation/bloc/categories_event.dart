import 'package:sadio_mane_store/features/categories/data/model/updata_category_request_model.dart';

sealed class CategoriesEvent {}

final class GetCategoriesEvent extends CategoriesEvent {}

final class AddCategoriesEvent extends CategoriesEvent {
  AddCategoriesEvent({required this.imageUrl});

  final String imageUrl;
}

final class DeleteCategoryEvent extends CategoriesEvent {
  DeleteCategoryEvent({required this.id});

  final int id;
}

final class UpdateCategoryEvent extends CategoriesEvent {
  UpdateCategoryEvent({required this.updateCategoryModel});

  UpdateCategoryRequestModel updateCategoryModel;
}
