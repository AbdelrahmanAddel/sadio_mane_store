import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/constants/images_string.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_bloc_consumer.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_container_content.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_loading.dart';

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<DashboardBloc>().add(GetAllDashboardDataEvent());
      },
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: BlocBuilder<DashboardBloc, DashboardState>(
              buildWhen:
                  (previous, current) =>
                      current is DashboardLoadingState ||
                      current is FailureGetAllDashboardDataState ||
                      current is GetAllDashboardDataState,
              builder: (context, state) {
                return switch (state) {
                  DashboardLoadingState() => _dashboardLoadingScreen(),
                  GetAllDashboardDataState() => _getAllDashboardScreen(state),
                  FailureGetAllDashboardDataState() => _failureStateScreen(
                    state,
                  ),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          ),
          const DashboardBlocListener(),
        ],
      ),
    );
  }

  Widget _dashboardLoadingScreen() {
    return Column(
      children: [
        LoadingShimmer(borderRadius: 30, width: double.infinity, height: 130.h),
        verticalSpace(20),
        LoadingShimmer(borderRadius: 30, width: double.infinity, height: 130.h),
        verticalSpace(20),
        LoadingShimmer(borderRadius: 30, width: double.infinity, height: 130.h),
      ],
    );
  }

  Widget _getAllDashboardScreen(
    GetAllDashboardDataState dashboardSuccessState,
  ) {
    return Column(
      children: [
        verticalSpace(20),

        CustomContainerLinearAdmin(
          height: 130.h,
          width: double.infinity,
          child: DashBoardContinerContent(
            title: 'Products',
            numbers: dashboardSuccessState.productsLength.toString(),
            imagePath: Assets.assetsImagesPngIosAndriod11SplashScreen,
          ),
        ),
        verticalSpace(20),

        CustomContainerLinearAdmin(
          height: 130.h,
          width: double.infinity,
          child: DashBoardContinerContent(
            title: 'Categorys',
            numbers: dashboardSuccessState.categoriesTotalLenght.toString(),
            imagePath: Assets.assetsImagesPngIosAndriod11SplashScreen,
          ),
        ),
        verticalSpace(20),
        CustomContainerLinearAdmin(
          height: 130.h,
          width: double.infinity,
          child: DashBoardContinerContent(
            title: 'Users',
            numbers: dashboardSuccessState.usersTotalLenght.toString(),
            imagePath: Assets.assetsImagesPngIosAndriod11SplashScreen,
          ),
        ),
      ],
    );
  }

  Widget _failureStateScreen(FailureGetAllDashboardDataState failureState) {
    return Center(
      child: Text(
        failureState.errorMessage,
        style: const TextStyle(fontSize: 50, color: Colors.red),
      ),
    );
  }
}
