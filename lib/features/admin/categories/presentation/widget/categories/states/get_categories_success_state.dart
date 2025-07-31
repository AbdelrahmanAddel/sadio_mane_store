import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/categories/data/model/get_categories_responce_model.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_bloc.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/bloc/categories_event.dart';
import 'package:sadio_mane_store/features/admin/categories/presentation/widget/categories/categories_container.dart';

Widget getCategoriesSuccessScreen(
  List<CategoriesDataModel> categoriesDataList,
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
            itemCount: categoriesDataList.length,

            itemBuilder:
                (context, index) => ProductContainer(
                  currentCategoryData: categoriesDataList[index],
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
