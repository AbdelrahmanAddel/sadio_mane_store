import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/search/presentation/bloc/search_bloc.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/build_choose_search_type.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/build_search_body.dart';

class SearchViewContent extends StatelessWidget {
  const SearchViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) {
          return current is ChangeSearchType;
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
