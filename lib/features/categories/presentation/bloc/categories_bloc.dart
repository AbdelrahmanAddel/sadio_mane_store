import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sadio_mane_store/features/categories/data/model/add_categories_request_model.dart';
import 'package:sadio_mane_store/features/categories/data/model/updata_category_request_model.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/add_categories_usecase.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/delete_category_usecase.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/get_categories_usecase.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/updata_category_usecase.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(
    this._getCategoriesUsecase,
    this._addCategoriesUsecase,
    this._deleteCategoryUsecase,
    this._updataCategoryUsecase,
  ) : super(GetCategoriesLoadingState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<AddCategoriesEvent>(_addCategories);
    on<DeleteCategoryEvent>(_deleteCategory);
    on<UpdateCategoryEvent>(_updateCategory);
  }
  final GetCategoriesUsecase _getCategoriesUsecase;
  final AddCategoriesUsecase _addCategoriesUsecase;
  final DeleteCategoryUsecase _deleteCategoryUsecase;
  final UpdataCategoryUsecase _updataCategoryUsecase;

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

  FutureOr<void> _deleteCategory(
    DeleteCategoryEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    add(GetCategoriesEvent());
    emit(DeleteCategoryLoadingState());
    await _deleteCategoryUsecase
        .call(event.id)
        .then((response) {
          response.fold(
            (failure) =>
                emit(DeleteCategoryFailureState(errorMessage: failure)),
            (success) {
              emit(DeleteCategorySuccessState(successMessage: success));

              add(GetCategoriesEvent());
            },
          );
        })
        .catchError((error) {
          emit(DeleteCategoryFailureState(errorMessage: error.toString()));
        });
  }

  FutureOr<void> _updateCategory(
    UpdateCategoryEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(UpdateCategoryLoading());
    await _updataCategoryUsecase
        .call(
          UpdateCategoryRequestModel(
            id: event.id,
            name: event.name,
            image: event.image,
          ),
        )
        .then((responce) {
          responce.fold(
            (error) => emit(UpdateCategoryFailure(errorMessage: error)),
            (success) {
              emit(UpdateCategorySuccess(successMessage: success));
              add(GetCategoriesEvent());
            },
          );
        });
  }
}
