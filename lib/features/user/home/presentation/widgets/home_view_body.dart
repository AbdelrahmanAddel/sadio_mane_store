import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_event.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/banner/home_view_banner.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/categories/home_view_categories.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/home_view_products.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/see_all_products_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.scrollController, super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    final homeBloc = context.watch<HomeBloc>();
    return RefreshIndicator(
      onRefresh: () async => homeBloc.add(GetHomeDetailsEvent()),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          const SliverToBoxAdapter(child: HomeViewBanner()),
          const SliverToBoxAdapter(child: HomeViewCategories()),
          SliverToBoxAdapter(child: verticalSpace(20)),
          const HomeViewProducts(),
          SliverToBoxAdapter(child: verticalSpace(20)),
          if (homeBloc.productsLength >= 10)
            const SeeAllProductsButton()
          else
            const SliverToBoxAdapter(),
        ],
      ),
    );
  }
}
