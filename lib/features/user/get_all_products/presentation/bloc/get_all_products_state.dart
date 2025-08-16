import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

abstract class GetAllProductsState {
  const GetAllProductsState({
    required this.hasMoreData,
    required this.productsList,
  });
  final bool hasMoreData;
  final List<ProductDataModel> productsList;
}

class GetAllProductsInitialState extends GetAllProductsState {
  const GetAllProductsInitialState({
    required super.hasMoreData,
    required super.productsList,
  });
}

class GetAllProductLoadingState extends GetAllProductsState {
  const GetAllProductLoadingState({
    required super.hasMoreData,
    required super.productsList,
  });
}

class GetAllProductLoadingMoreState extends GetAllProductsState {
  const GetAllProductLoadingMoreState({
    required super.hasMoreData,
    required super.productsList,
  });
}

class GetAllProductSuccessState extends GetAllProductsState {
  const GetAllProductSuccessState({
    required super.hasMoreData,
    required super.productsList,
  });
}

class GetAllProductFailureState extends GetAllProductsState {
  const GetAllProductFailureState(
    this.errorMessage, {
    required super.hasMoreData,
    required super.productsList,
  });
  final String errorMessage;
}
