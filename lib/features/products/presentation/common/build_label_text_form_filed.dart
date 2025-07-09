import 'package:flutter/material.dart';
import 'package:sadio_mane_store/core/common/widget/custom_text_form_field.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

Widget buildLabeledTextField({
  required String text,
  int? maxline,
  TextEditingController? controller,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(text),
      verticalSpace(10),
      CustomTextFormField(
        validator: validator,
        maxlines: maxline,
        hintText: text,
        controller: controller,
      ),
    ],
  );
}
