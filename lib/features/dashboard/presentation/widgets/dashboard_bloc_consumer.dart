import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class DashboardBlocListener extends StatelessWidget {
  const DashboardBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardState>(
      listenWhen: (previous, current) {
        switch (current) {
          case FailureGetTotalCategoriesNumberState():
            return true;
          case FailureGetTotalProductLengthState():
            return true;
          case FailureGetTotalUsersNumberState():
            return true;
          default:
            return false;
        }
      },
      listener: (context, state) {
        if (state is FailureGetTotalCategoriesNumberState) {
          customFlutterToast(
            message: state.errorMessage,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
          );
        } else if (state is FailureGetTotalProductLengthState) {
          customFlutterToast(
            message: state.failure,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
          );
        } else if (state is FailureGetTotalUsersNumberState) {
          customFlutterToast(
            message: state.errorMessage,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16,
          );
        }
      },
      builder: (context, state) => const SizedBox.shrink(),
    );
  }
}
