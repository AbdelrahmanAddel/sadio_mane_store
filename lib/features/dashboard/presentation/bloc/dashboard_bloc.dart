import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_products_length_usecase.dart';
import 'package:sadio_mane_store/features/dashboard/logic/usecase/get_users_total_number_usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc(this.getProductsLengthUsecase, this.getUsersTotalNumberUseCase)
    : super(DashboardLoadingState()) {
    on<GetUsersTotalNumberEvent>(_getUsersTotalNumber);

    on<GetProductsTotalLengthEvent>(getProductsTotalLength);
  }
  final GetProductsLengthUsecase getProductsLengthUsecase;
  final GetUsersTotalNumberUseCase getUsersTotalNumberUseCase;

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
}
