// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sadio_mane_store/features/user/category_products/domain/usecases/get_product_by_category_id_usecase.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/bloc/category_details_event.dart';
import 'package:sadio_mane_store/features/user/category_products/presentation/bloc/category_details_state.dart';

class CategoryDetailsBloc
    extends Bloc<CategoryDetailsEvent, CategoryDetailsState> {
  CategoryDetailsBloc(this.getProductByCategoryIdUsecase)
    : super(GetProductsByCategoryIdLoading()) {
    on<GetProductsByCategoryIdEvent>(_getProductByCategoryId);
  }
  final GetProductByCategoryIdUsecase getProductByCategoryIdUsecase;

  FutureOr<void> _getProductByCategoryId(
    GetProductsByCategoryIdEvent event,
    Emitter<CategoryDetailsState> emit,
  ) async {
    emit(GetProductsByCategoryIdLoading());
    final response = await getProductByCategoryIdUsecase.call(event.categoryId);
    response.fold(
      (error) {
        emit(GetProductsByCategoryIdError(error));
      },
      (success) {
        emit(GetProductsByCategoryIdSuccess(success));
      },
    );
  }
}
