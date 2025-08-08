import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/home/data/models/banner_models/sub_models/banner_product_data_model.dart';

sealed class HomeState {
  const HomeState();
}

final class HomeInitial extends HomeState {}

final class GetBannersLoadingState extends HomeState {}

final class GetBannersSuccessState extends HomeState {
  const GetBannersSuccessState(this.banners);

  final List<BannerProductDataModel> banners;
}

final class GetBannersErrorState extends HomeState {
  const GetBannersErrorState(this.error);

  final String error;
}

final class GetCategoriesLoadingState extends HomeState {}

final class GetCategoriesSuccessState extends HomeState {
  const GetCategoriesSuccessState(this.categories);

  final List<CategoriesDataModel> categories;
}

final class GetCategoriesErrorState extends HomeState {
  const GetCategoriesErrorState(this.error);

  final String error;
}

final class GetProductsLoadingState extends HomeState {}

final class GetProductsSuccessState extends HomeState {
  const GetProductsSuccessState(this.products);

  final List<ProductDataModel> products;
}

final class GetProductsErrorState extends HomeState {
  const GetProductsErrorState(this.error);

  final String error;
}
