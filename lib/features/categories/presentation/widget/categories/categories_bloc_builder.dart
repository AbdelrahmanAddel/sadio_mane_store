import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/categories/categories_container.dart';
import 'package:sadio_mane_store/features/dashboard/presentation/widgets/dashboard_loading.dart';

class CategoriesBlocBuilder extends StatelessWidget {
  const CategoriesBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      buildWhen: (previous, current) {
        switch (current) {
          case LoadingToGetCategoriesState():
            return true;

          case GetCategoriesSuccessState():
            return true;

          case GetCategoriesFailureState():
            return true;
          default:
            return false;
        }
      },
      builder: (context, state) {
        return switch (state) {
          LoadingToGetCategoriesState() => Expanded(child: loadingToGetCategoriesScreen()),
          GetCategoriesSuccessState() => Expanded(
            child: getCategoriesSuccessScreen(state, context),
          ),
          GetCategoriesFailureState() => failureToGetCategoriesScreen(),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget failureToGetCategoriesScreen() {
    return CachedNetworkImage(
      imageUrl:
          'https://img.freepik.com/free-vector/no-data-concept-illustration_114360-626.jpg?semt=ais_hybrid&w=740',
    );
  }

  Widget getCategoriesSuccessScreen(
    GetCategoriesSuccessState categoriesData,
    BuildContext context,
  ) {
    return RefreshIndicator(
      onRefresh: () async {
        getIt<CategoriesBloc>().add(GetCategoriesEvent());
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ListView.separated(
              reverse: true,
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: categoriesData.categoriesData.length,

              itemBuilder:
                  (context, index) => ProductContainer(
                    categoryName:
                        categoriesData.categoriesData[index].name ?? 'No Name',
                    categoryImage:
                        categoriesData.categoriesData[index].image ?? '',
                  ),
              separatorBuilder: (BuildContext context, int index) {
                return verticalSpace(20);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget loadingToGetCategoriesScreen() {
    return ListView.separated(
      itemCount: 10,
      itemBuilder: (context, index) {
        return LoadingShimmer(
          width: double.infinity,
          height: 130.h,
          borderRadius: 20,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return verticalSpace(15);
      },
    );
  }
}
