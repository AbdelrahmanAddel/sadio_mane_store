import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_create_drop_down.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/products/presentation/widgets/edit_products/edit_bottom_images_list.dart';

class EditProductBottomSheetContent extends StatelessWidget {
  const EditProductBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text('Edit Product', style: TextStyle(fontSize: 30)),
          ),
          verticalSpace(20),
          const Text('Edit a photo', style: TextStyle(fontSize: 20)),
          verticalSpace(20),
          const EditBottomImagesList(),
          verticalSpace(20),
          _buildLabeledTextField(text: 'Title'),
          verticalSpace(10),
          _buildLabeledTextField(text: 'Price'),
          verticalSpace(10),
          _buildLabeledTextField(text: 'Description', maxline: 5),
          verticalSpace(20),
          CustomCreateDropDown(
            items: const [],
            hintText: 'Sadio',
            onChanged: (string) {},
            value: 'value',
          ),
          verticalSpace(20),

          const CustomAppButton(width: double.infinity, child: Text('Done')),
        ],
      ),
    );
  }
}

Widget _buildLabeledTextField({required String text, int? maxline}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text),
      verticalSpace(10),
      CustomTextFormField(maxlines: maxline, hintText: text),
    ],
  );
}
