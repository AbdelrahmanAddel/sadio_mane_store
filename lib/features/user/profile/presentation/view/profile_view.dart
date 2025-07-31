import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/profile_feature_item.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/profile_header.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: [
            verticalSpace(70),
            const ProfileHeader(),
            verticalSpace(20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                context.tr.application_features,
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
              ),
            ),
            verticalSpace(25),
            const ProfileFeatureItem(),
          ],
        ),
      ),
    );
  }
}
