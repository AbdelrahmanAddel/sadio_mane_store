import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_bloc.dart';
import 'package:sadio_mane_store/features/user/home/presentation/bloc/home_event.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/banner/home_view_banner.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/categories/home_view_categories.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({required this.scrollController, super.key});
  final ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => context.read<HomeBloc>().add(GetBannersEvent()),
      child: CustomScrollView(
        controller: scrollController,
        slivers: const [
          SliverToBoxAdapter(child: HomeViewBanner()),

          SliverToBoxAdapter(child: HomeViewCategories()),
        ],
      ),
    );
  }
}
