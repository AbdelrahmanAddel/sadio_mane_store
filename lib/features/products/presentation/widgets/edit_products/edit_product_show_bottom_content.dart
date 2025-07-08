import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_create_drop_down.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/products/presentation/common/bottom_images_list.dart';
import 'package:sadio_mane_store/features/products/presentation/common/build_label_text_form_filed.dart';

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
          const BottomImagesList(isEdit: true),
          verticalSpace(20),
          buildLabeledTextField(text: 'Title'),
          verticalSpace(10),
          buildLabeledTextField(text: 'Price'),
          verticalSpace(10),
          buildLabeledTextField(text: 'Description', maxline: 5),
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
