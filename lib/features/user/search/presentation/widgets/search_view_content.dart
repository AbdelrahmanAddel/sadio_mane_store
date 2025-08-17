import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/admin/products/data/model/products_model.dart';
import 'package:sadio_mane_store/features/user/home/presentation/widgets/product/product_list_item.dart';
import 'package:sadio_mane_store/features/user/search/presentation/bloc/search_bloc.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/build_choose_search_type.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/search_text_form_fields.dart';

class SearchViewContent extends StatelessWidget {
  const SearchViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) {
          return current is ChangeSearchType ||
              current is SearchByPriceSuccessState ||
              current is SearchByPriceLoadingState ||
              current is SearchByPriceErrorState;
        },
        builder: (context, state) {
          return Column(
            children: [
              verticalSpace(40),
              BuildChooseSearchType(type: state.searchType),
              verticalSpace(20),
              if (state.searchType == SearchType.none)
                _buildInitSearchState()
              else
                Expanded(child: BuildSearchBody()),
            ],
          );
        },
      ),
    );
  }
}

Widget _buildInitSearchState() {
  return const Center(child: Icon(Icons.search, size: 100));
}

class BuildSearchBody extends StatelessWidget {
  BuildSearchBody({super.key});
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController searchNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return current is SearchByPriceSuccessState ||
            current is SearchByPriceLoadingState ||
            current is SearchByPriceErrorState ||
            current is ChangeSearchType;
      },
      builder: (context, state) {
        return Column(
          children: [
            _buildSearchBody(state.searchType, context),
            verticalSpace(20),
            switch (state) {
              SearchByPriceSuccessState() => Expanded(
                child: BuildGetSearchProductsSuccessState(
                  products: state.products,
                ),
              ),
              SearchByPriceLoadingState() => const Center(
                child: CircularProgressIndicator(),
              ),
              SearchByPriceErrorState() => Center(
                child: Text(
                  state.error,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
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
            SearchByPriceEvent(
              minPrice: int.parse(minPriceController.text),
              maxPrice: int.parse(maxPriceController.text),
            ),
          ),
          width: 120.w,
          height: 35.h,
          child: const Text('Search'),
        ),
      ],
    );
  }
}

class BuildGetSearchProductsSuccessState extends StatelessWidget {
  const BuildGetSearchProductsSuccessState({required this.products, super.key});
  final List<ProductDataModel> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        return ProductCart(product: products[index]);
      },
    );
  }
}
