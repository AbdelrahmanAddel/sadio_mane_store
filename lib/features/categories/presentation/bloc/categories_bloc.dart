import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/categories/logic/usecase/get_categories_usecase.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc(this.getCategoriesUsecase)
    : super(LoadingToGetCategoriesState()) {
    on<GetCategoriesEvent>(_getCategories);
  }
  GetCategoriesUsecase getCategoriesUsecase;

  FutureOr<void> _getCategories(
    GetCategoriesEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(LoadingToGetCategoriesState());
    print('=>>>>>>>>>>>>>>>>>>>>>> Loading');
    final responce = await getCategoriesUsecase.call();
    responce.fold(
      (failure) => emit(GetCategoriesFailureState(errorMessage: failure)),
      (success) => emit(
        GetCategoriesSuccessState(
          categoriesData: success.data?.categories ?? [],
        ),
      ),
    );
  }
}
