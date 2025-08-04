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
