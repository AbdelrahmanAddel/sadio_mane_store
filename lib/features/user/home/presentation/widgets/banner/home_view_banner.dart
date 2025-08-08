import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/dashboard/presentation/widgets/dashboard_loading.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_state.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/banner/states/build_home_banner_success_state.dart';

class HomeViewBanner extends StatelessWidget {
  const HomeViewBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        switch (current) {
          case GetBannersLoadingState():
          case GetBannersSuccessState():
          case GetBannersErrorState():
            return true;
          default:
            return false;
        }
      },
      builder: (context, state) {
        switch (state) {
          case GetBannersLoadingState():
            return _buildHomeViewLoadingState();
          case GetBannersSuccessState():
            return BuildHomeViewSuccessState(banners: state.banners);
          case GetBannersErrorState():
            return _buildHomeViewErrorState(error: state.error);
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }

  Widget _buildHomeViewErrorState({required String error}) {
    return Center(
      child: Text(error, style: TextStyle(fontSize: 20.sp)),
    );
  }

  Widget _buildHomeViewLoadingState() {
    return SizedBox(
      height: 180.h,
      child: Column(
        children: [
          LoadingShimmer(height: 150.h),
          verticalSpace(10),
        ],
      ),
    );
  }
}
