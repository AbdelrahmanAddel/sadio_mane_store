import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/categories/presentation/bloc/categories_state.dart';
import 'package:sadio_mane_store/features/categories/presentation/widget/categories/categories_container.dart';

Widget getCategoriesSuccessScreen(
  GetCategoriesSuccessState categoriesData,
  BuildContext context,
) {
  return RefreshIndicator(
    onRefresh: () async {
      if (context.mounted) {
        context.read<CategoriesBloc>().add(GetCategoriesEvent());
      }
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
                  currentCategoryId: int.parse(
                    categoriesData.categoriesData[index].id.toString(),
                  ),
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
