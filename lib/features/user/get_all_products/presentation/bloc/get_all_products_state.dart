import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

abstract class GetAllProductsState {
  const GetAllProductsState({
    required this.noMoreData,
    required this.hasMoreData,
    required this.productsList,
  });
  final bool hasMoreData;
  final bool noMoreData;
  final List<ProductDataModel> productsList;
}

class GetAllProductsInitialState extends GetAllProductsState {
  const GetAllProductsInitialState({
    required super.hasMoreData,
    required super.productsList,
    required super.noMoreData,
  });
}

class GetAllProductLoadingState extends GetAllProductsState {
  const GetAllProductLoadingState({
    required super.hasMoreData,
    required super.productsList,
    required super.noMoreData,
  });
}

class GetAllProductLoadingMoreState extends GetAllProductsState {
  const GetAllProductLoadingMoreState({
    required super.hasMoreData,
    required super.productsList,
    required super.noMoreData,
  });
}

class GetAllProductSuccessState extends GetAllProductsState {
  const GetAllProductSuccessState({
    required super.hasMoreData,
    required super.productsList,
    required super.noMoreData,
  });
}

class GetAllProductFailureState extends GetAllProductsState {
  const GetAllProductFailureState(
    this.errorMessage, {
    required super.hasMoreData,
    required super.productsList,
    required super.noMoreData,
  });
  final String errorMessage;
}
