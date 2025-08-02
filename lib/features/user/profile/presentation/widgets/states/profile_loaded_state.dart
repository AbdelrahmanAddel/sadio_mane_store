import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/extensions/localization_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/profile_feature_item.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/profile_header.dart';

class ProfileLoadedWidget extends StatelessWidget {
  const ProfileLoadedWidget({required this.userProfile, super.key});

  final UserProfileModel userProfile;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(120),
        Center(child: ProfileHeader(userProfileData: userProfile)),
        verticalSpace(40),
        Text(
          context.tr.application_features,
          style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w400),
        ),
        FadeInRight(child: const ProfileFeatureItem()),
      ],
    );
  }
}
