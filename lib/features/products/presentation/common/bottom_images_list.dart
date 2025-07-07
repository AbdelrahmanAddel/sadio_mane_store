import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class BottomImagesList extends StatelessWidget {
  const BottomImagesList({
    required this.isEdit,
    required this.imageUrl, super.key,
    this.onPressed,
  });
  final bool isEdit;
  final String imageUrl;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          width: double.infinity,
          height: 120.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey[400],
            image: DecorationImage(image: NetworkImage(imageUrl)),
          ),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              isEdit ? Icons.edit : Icons.add_a_photo,
              size: 50,
              color: Colors.white,
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return verticalSpace(10);
      },
    );
  }
}
