
import 'package:equatable/equatable.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';

sealed class GetAllProductsState extends Equatable {
  const GetAllProductsState({
    required this.hasMoreData,
    required this.productsList,
  });

  final bool hasMoreData;
  final List<ProductDataModel> productsList;
  @override
  List<Object?> get props => [hasMoreData, productsList];
}

final class GetAllProductsInitialState extends GetAllProductsState {
  const GetAllProductsInitialState({
    required super.hasMoreData,
    required super.productsList,
  });
}

final class GetAllProductLoadingState extends GetAllProductsState {
  const GetAllProductLoadingState({
    required super.hasMoreData,
    required super.productsList,
  });
}

final class GetAllProductSuccessState extends GetAllProductsState {
  const GetAllProductSuccessState({
    required super.hasMoreData,
    required super.productsList,
  });
}

final class GetAllProductFailureState extends GetAllProductsState {
  const GetAllProductFailureState(
    this.errorMessage, {
    required super.hasMoreData,
    required super.productsList,
  });
  final String errorMessage;
  @override
  List<Object?> get props => [errorMessage];
}
