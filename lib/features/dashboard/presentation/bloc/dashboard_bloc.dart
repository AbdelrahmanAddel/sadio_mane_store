import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_categories_model.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_product_model.dart';
import 'package:sadio_mane_store/features/dashboard/data/model/dashboard_users_model.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_categories_length_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_products_length_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_users_total_number_usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
    this.getProductsLengthUsecase,
    this.getUsersTotalNumberUseCase,
    this.getCategoriesLengthUsecase,
  ) : super(DashboardStateInitState()) {
    on<GetUsersTotalNumberEvent>(_getUsersTotalNumber);
    on<GetProductsTotalLengthEvent>(getProductsTotalLength);
    on<GetCategoriesTotalNumberEvent>(getCategoriesLength);
    on<GetAllDashboardDataEvent>(_getAllDashboardData);
  }
  final GetProductsLengthUsecase getProductsLengthUsecase;
  final GetUsersTotalNumberUseCase getUsersTotalNumberUseCase;
  final GetCategoriesLengthUsecase getCategoriesLengthUsecase;
  FutureOr<void> getProductsTotalLength(
    GetProductsTotalLengthEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoadingState());
    debugPrint('🔥 GetProductsTotalLengthEvent fired');
    final responce = await getProductsLengthUsecase.call();
    responce.fold(
      (failure) {
        debugPrint('Error fetching products length: $failure');
        emit(FailureGetTotalProductLengthState(failure: failure));
      },
      (data) {
        debugPrint(
          'Products length fetched successfully: ${data.data?.products?.length}',
        );
        emit(
          GetTotalProductLengthState(
            productsLength: data.data?.products?.length,
          ),
        );
      },
    );
  }

  FutureOr<void> _getUsersTotalNumber(
    GetUsersTotalNumberEvent event,
    Emitter<DashboardState> emit,
  ) async {
    final responce = await getUsersTotalNumberUseCase.call();
    responce.fold(
      (error) => emit(FailureGetTotalUsersNumberState(errorMessage: error)),
      (data) {
        debugPrint('Total User Length => ${data.data?.users?.length}');

        emit(
          GetTotalUsersNumberState(usersTotalLenght: data.data?.users?.length),
        );
      },
    );
  }

  FutureOr<void> getCategoriesLength(
    GetCategoriesTotalNumberEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoadingState());
    final responce = await getCategoriesLengthUsecase.call();
    responce.fold(
      (failure) {
        debugPrint('Error fetching categories length: $failure');
        emit(FailureGetTotalCategoriesNumberState(errorMessage: failure));
      },
      (data) {
        debugPrint(
          'Categories length fetched successfully: ${data.data?.categories?.length}',
        );
        emit(
          GetTotalCategoriesNumberState(
            categoriesTotalLenght: data.data?.categories?.length,
          ),
        );
      },
    );
  }

  FutureOr<void> _getAllDashboardData(
    GetAllDashboardDataEvent event,
    Emitter<DashboardState> emit,
  ) async {
    final productsResponse = await getProductsLengthUsecase.call();
    final usersResponse = await getUsersTotalNumberUseCase.call();
    final categoriesResponse = await getCategoriesLengthUsecase.call();

    if (productsResponse.isLeft() ||
        usersResponse.isLeft() ||
        categoriesResponse.isLeft()) {
      emit(
        FailureGetAllDashboardDataState(
          errorMessage: 'Failed to load dashboard data',
        ),
      );
      return;
    }
    final productsLength = productsResponse.getOrElse(DashBoardModel.new);
    final categoriesLength = categoriesResponse.getOrElse(
      DashboardCategoriesModel.new,
    );
    final allUsersLength = usersResponse.getOrElse(DashboardUsersModel.new);
    emit(
      GetAllDashboardDataState(
        productsLength: productsLength.data?.products?.length,
        usersTotalLenght: allUsersLength.data?.users?.length,
        categoriesTotalLenght: categoriesLength.data?.categories?.length,
      ),
    );
  }
}
