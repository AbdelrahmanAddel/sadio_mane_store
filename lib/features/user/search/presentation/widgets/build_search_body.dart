import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/search/presentation/bloc/search_bloc.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/build_get_search_products_success_state.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/search_text_form_fields.dart';

class BuildSearchBody extends StatelessWidget {
  BuildSearchBody({super.key});
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController searchNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return current is SearchSuccessState ||
            current is SearchLoadingState ||
            current is SearchErrorState ||
            current is ChangeSearchType;
      },
      builder: (context, state) {
        return Column(
          children: [
            _buildSearchBody(state.searchType, context),
            verticalSpace(20),
            switch (state) {
              SearchSuccessState() => Expanded(
                child: BuildGetSearchProductsSuccessState(
                  products: state.products,
                ),
              ),
              SearchLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
              SearchErrorState() => Center(
                child: Text(
                  state.error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ChangeSearchType() => Expanded(
                child: BuildGetSearchProductsSuccessState(
                  products: state.cachedProduct,
                ),
              ),
              _ => const SizedBox.shrink(),
            },
          ],
        );
      },
    );
  }

  Widget _buildSearchBody(SearchType searchType, BuildContext context) {
    final searchBloc = context.read<SearchBloc>();
    return Column(
      children: [
        SearchTextFormFields(
          searchType: searchType,
          minPriceController: minPriceController,
          maxPriceController: maxPriceController,
          searchNameController: searchNameController,
        ),
        verticalSpace(20),

        CustomAppButton(
          onTap: () => searchBloc.add(
            searchType == SearchType.price
                ? SearchByPriceEvent(
                    minPrice: int.parse(minPriceController.text),
                    maxPrice: int.parse(maxPriceController.text),
                  )
                : SearchByTitleEvent(title: searchNameController.text),
          ),
          width: 120.w,
          height: 35.h,
          child: const Text('Search'),
        ),
      ],
    );
  }
}
