import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class ModalBottomSheetContent extends StatelessWidget {
  const ModalBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text('Add Categories', style: TextStyle(fontSize: 30)),
        ),
        verticalSpace(20),
        const Text('Add a photo', style: TextStyle(fontSize: 20)),
        verticalSpace(20),
        Container(
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[400],
          ),
          child: const Icon(Icons.add_a_photo, size: 70),
        ),
        verticalSpace(20),

        const Text(
          'Enter The Categoreis Name',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w100),
        ),
        verticalSpace(20),
        const CustomTextFormField(hintText: 'Category Name'),
        verticalSpace(20),

        const CustomAppButton(
          width: double.infinity,
          child: Text('Create A New Category'),
        ),
      ],
    );
  }
}
