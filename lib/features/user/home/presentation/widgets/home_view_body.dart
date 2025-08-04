import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_container_linear_admin.dart';
import 'package:sadio_mane_store/core/common/widget/custom_network_image.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_event.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/banner/home_view_banner.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/categories/home_view_categories.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/product_list_item.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.scrollController, super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      //TODO => Make Event
      onRefresh: () async => context.read<HomeBloc>().add(GetBannersEvent()),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverToBoxAdapter(child: HomeViewBanner()),
          const SliverToBoxAdapter(child: HomeViewCategories()),
          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverGrid.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (context, index) => const ProductItem(),
          ),
        ],
      ),
    );
  }
}
