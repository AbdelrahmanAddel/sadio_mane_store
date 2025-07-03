import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sadio_mane_store/features/categories/data/model/add_categories_request_model.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/add_categories_usecase.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/get_categories_usecase.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this._getCategoriesUsecase, this._addCategoriesUsecase)
    : super(GetCategoriesLoadingState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<AddCategoriesEvent>(_addCategories);
  }
  final GetCategoriesUsecase _getCategoriesUsecase;
  final AddCategoriesUsecase _addCategoriesUsecase;
  final addCategoryFormKey = GlobalKey<FormState>();
  final addCategoryNameController = TextEditingController();

  FutureOr<void> _getCategories(
    GetCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(GetCategoriesLoadingState());
    final responce = await _getCategoriesUsecase.call();
    responce.fold(
      (failure) => emit(GetCategoriesFailureState(errorMessage: failure)),
      (success) => emit(
        GetCategoriesSuccessState(
          categoriesData: success.data?.categories ?? [],
        ),
      ),
    );
  }

  FutureOr<void> _addCategories(
    AddCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(AddCategoriesLoadingState());
    final response = await _addCategoriesUsecase.call(
      AddCategoriesRequestModel(
        name: addCategoryNameController.text,
        image: event.imageUrl,
      ),
    );
    response.fold(
      (failure) => emit(AddCategoriesFailureState(errorMessage: failure)),
      (success) {
        addCategoryNameController.clear();
        emit(AddCategoriesSuccessState(successMessage: 'Added Successfully'));
      },
    );
  }
}
