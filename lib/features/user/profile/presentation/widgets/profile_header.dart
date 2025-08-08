import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/extensions/strings_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';
import 'package:sadio_mane_store/features/user/profile/data/models/user_profile_model.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({required this.userProfileData, super.key});
  final UserProfileModel userProfileData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50.r,
          child: CachedNetworkImage(
            imageUrl: userProfileData.avatar ?? '',
            imageBuilder: (context, imageProvider) =>
                CircleAvatar(radius: 50.r, backgroundImage: imageProvider),
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
        verticalSpace(12),
        Text(
          userProfileData.name.toString().capitalize,
          style: TextStyle(fontSize: 20.sp),
        ),
        verticalSpace(12),
        Text(
          userProfileData.email ?? '',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
