import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/core/dependency_injection.dart/dependency_injection.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_bloc.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/bloc/profile_event.dart';
import 'package:sadio_mane_store/features/user/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: BlocProvider(
          create: (context) => getIt<ProfileBloc>()..add(GetProfileEvent()),
          child: const ProfileViewBody(),
        ),
      ),
    );
  }
}
