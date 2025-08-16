import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/search/presentation/bloc/search_bloc.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/build_choose_search_type.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/search_text_form_fields.dart';

class SearchViewContent extends StatelessWidget {
  SearchViewContent({super.key});
  TextEditingController minPriceController = TextEditingController();
  TextEditingController maxPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          return Column(
            children: [
              verticalSpace(40),
              BuildChooseSearchType(type: state.searchType),
              verticalSpace(20),
              if (state.searchType == SearchType.none)
                _buildInitSearchState()
              else
                _buildSearchBody(state.searchType, context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchBody(SearchType searchType, BuildContext context) {
    final searchBloc = getIt<SearchBloc>();
    return Column(
      children: [
        SearchTextFormFields(
          searchType: searchType,
          minPriceController: minPriceController,
          maxPriceController: maxPriceController,
        ),
        verticalSpace(20),

        CustomAppButton(
          onTap: () => searchBloc.add(
            SearchByPriceEvent(
              minPrice: int.parse(minPriceController.text),
              maxPrice: int.parse(maxPriceController.text),
            ),
          ),
          width: 120,
          height: 35,
          child: const Text('Search'),
        ),
      ],
    );
  }

  Widget _buildInitSearchState() {
    return const Center(child: Icon(Icons.search, size: 100));
  }
}
