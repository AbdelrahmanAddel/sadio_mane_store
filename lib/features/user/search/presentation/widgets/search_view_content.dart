import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
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
        builder: (context, state) {
          return Column(
            children: [
              verticalSpace(40),
              BuildChooseSearchType(type: state.searchType),
              verticalSpace(20),
              if (state.searchType == SearchType.none)
                _buildInitSearchState()
              else
                _buildSearchBody(state.searchType),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSearchBody(SearchType searchType) {
    return Column(
      children: [
        SearchTextFormFields(searchType: searchType),
        verticalSpace(20),

        const CustomAppButton(width: 120, height: 35, child: Text('Save')),
      ],
    );
  }

  Widget _buildInitSearchState() {
    return const Center(child: Icon(Icons.search, size: 100));
  }
}
