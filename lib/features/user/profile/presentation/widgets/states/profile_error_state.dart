import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';

class ProfileErrorWidget extends StatelessWidget {
  const ProfileErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            context.tr.something_went_wrong,
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
