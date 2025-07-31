import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/model/dashboard_categories_model.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/model/dashboard_product_model.dart';
import 'package:sadio_mane_store/features/admin/dashboard/data/model/dashboard_users_model.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/usecase/get_categories_length_usecase.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/usecase/get_products_length_usecase.dart';
import 'package:sadio_mane_store/features/admin/dashboard/logic/usecase/get_users_total_number_usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(
    this.getProductsLengthUsecase,
    this.getUsersTotalNumberUseCase,
    this.getCategoriesLengthUsecase,
  ) : super(DashboardLoadingState()) {
    on<GetAllDashboardDataEvent>(getAllDashboardData);
  }
  final GetProductsLengthUsecase getProductsLengthUsecase;
  final GetUsersTotalNumberUseCase getUsersTotalNumberUseCase;
  final GetCategoriesLengthUsecase getCategoriesLengthUsecase;


  FutureOr<void> getAllDashboardData(
    GetAllDashboardDataEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(DashboardLoadingState());
    final productsResponse = await getProductsLengthUsecase.call();
    final usersResponse = await getUsersTotalNumberUseCase.call();
    final categoriesResponse = await getCategoriesLengthUsecase.call();

    if (productsResponse.isLeft()) {
      emit(
        FailureGetTotalProductLengthState(
          failure: 'Failure To Get Product Length',
        ),
      );
    } 
   else  if (usersResponse.isLeft()) {
      emit(
        FailureGetTotalUsersNumberState(
          errorMessage: 'Failure To Get Users Length',
        ),
      );
    } else if (categoriesResponse.isLeft()) {
      emit(
        FailureGetTotalCategoriesNumberState(
          errorMessage: 'Failure To Get Categories Length',
        ),
      );
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
