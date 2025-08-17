import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/search/presentation/enums/search_type.dart';

class SearchTextFormFields extends StatelessWidget {
  const SearchTextFormFields({
    required this.searchType,
    required this.minPriceController,
    required this.maxPriceController,
    required this.searchNameController,
    super.key,
  });
  final SearchType searchType;
  final TextEditingController minPriceController;
  final TextEditingController maxPriceController;
  final TextEditingController searchNameController;

  @override
  Widget build(BuildContext context) {
    return searchType == SearchType.name
        ? CustomTextFormField(
            hintText: 'Search For Products Name',
            controller: searchNameController,
          )
        : _buildSearchByPriceTextFormFields();
  }

  Widget _buildSearchByPriceTextFormFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: CustomTextFormField(
            hintText: 'Min Price',
            controller: minPriceController,
          ),
        ),
        horizontalSpace(10),
        Expanded(
          child: CustomTextFormField(
            hintText: 'Max Price',
            controller: maxPriceController,
          ),
        ),
      ],
    );
  }
}
