import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/helpers/extensions/strings_extension.dart';
import 'package:sadio_mane_store/core/helpers/spacer_helper.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(radius: 50.r, child: const Icon(Icons.person, size: 50)),
        verticalSpace(12),
        Text('PROFILE'.capitalize, style: TextStyle(fontSize: 20.sp)),
        verticalSpace(12),
        Text(
          'SadioMane@gmail.com',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
} 