import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_app_button.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';

class NotificationBottomSheetContent extends StatelessWidget {
  const NotificationBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Add Notification ',

              style: context.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          verticalSpace(20),
          const Text('Enter The Notification Title'),
          verticalSpace(20),
          const CustomTextFormField(hintText: 'Title'),
          verticalSpace(20),
          const Text('Enter The Notification Body'),
          verticalSpace(20),
          const CustomTextFormField(hintText: 'Body'),
          verticalSpace(20),
          const Text('Enter The Notification product Id'),
          verticalSpace(20),
          const CustomTextFormField(
            keyboardType: TextInputType.number,
            hintText: 'Product Id',
          ),
          verticalSpace(20),
          const CustomAppButton(width: double.infinity, child: Text('Add')),
        ],
      ),
    );
  }
}
