import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/search/presentation/widgets/build_choose_search_type.dart';

class SearchViewContent extends StatelessWidget {
  const SearchViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          verticalSpace(40),
          const BuildChooseSearchType(),
          verticalSpace(20),
          const CustomTextFormField(hintText: 'Search For Products Name'),
          verticalSpace(20),
          const CustomAppButton(width: 120, height: 35, child: Text('Save')),
        ],
      ),
    );
  }
}
