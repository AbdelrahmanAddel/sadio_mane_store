import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';

class SearchTextFormFields extends StatelessWidget {
  const SearchTextFormFields({required this.searchType, super.key});
  final SearchType searchType;

  @override
  Widget build(BuildContext context) {
    return searchType == SearchType.name
        ? const CustomTextFormField(hintText: 'Search For Products Name')
        : _buildSearchByPriceTextFormFields();
  }

  Widget _buildSearchByPriceTextFormFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Expanded(child: CustomTextFormField(hintText: 'Min Price')),
        horizontalSpace(10),
        const Expanded(child: CustomTextFormField(hintText: 'Max Price')),
      ],
    );
  }
}
