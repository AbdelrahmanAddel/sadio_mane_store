import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';
import 'package:sadio_mane_store/core/common/functions/custom_flutter_toast.dart';
import 'package:sadio_mane_store/core/common/widget/custom_circle_avatar_with_gesture_detector.dart';
import 'package:sadio_mane_store/core/theme/extensions/app_theme_extension.dart';
import 'package:sadio_mane_store/features/sign_up/presentation/cubit/sign_up_cubit.dart';

class SignUpCircleAvatar extends StatelessWidget {
  const SignUpCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadImageCubit = context.read<UploadImageCubit>();
    final signUpCubit = context.read<SignUpCubit>();
    return BlocConsumer<UploadImageCubit, UploadImageState>(
      listenWhen: (previous, current) => current is UploadImageErrorState || current is UploadImageSuccessState,
      listener: (context, state) {
        if (state is UploadImageErrorState) {
          customFlutterToast(message: state.message);
        } else if (state is UploadImageSuccessState) {
          signUpCubit.urlImage = state.imageResponce.location!;
        }
      },
      buildWhen: (previous, current) {
        return current is UploadImageSuccessState ||
            current is UploadImageInitialState ||
            current is UploadImageLoadingState;
      },
      builder: (context, state) {
        return switch (state) {
          UploadImageInitialState() => _buildInitialState(
            uploadImageCubit,
            context,
          ),

          UploadImageSuccessState() => _buildSuccessState(
            state,
            uploadImageCubit,
            signUpCubit,
          ),

          UploadImageLoadingState() => _buildLoadingState(),
          _ => const SizedBox.shrink(),
        };
      },
    );
  }

  Widget _buildInitialState(
    UploadImageCubit uploadImageCubit,
    BuildContext context,
  ) {
    return CustomCircleAvatarWithGestureDetector(
      onTap: () async {
        final image = await uploadImageCubit.pickImageFromGallery();
        await uploadImageCubit.getImageUrl(image!);
      },
      child: CircleAvatar(
        backgroundColor: context.theme.appColors.bluePinkDark,
        radius: 40.r,
        child: const Icon(Icons.person, size: 40, color: Colors.white),
      ),
    );
  }

  Widget _buildSuccessState(
    UploadImageSuccessState state,
    UploadImageCubit uploadImageCubit,
    SignUpCubit signUpCubit,
  ) {
    return CustomCircleAvatarWithGestureDetector(
      backgroundImage: NetworkImage(state.imageResponce.location!),

      child: Align(
        alignment: Alignment.bottomRight,
        child: IconButton(
          icon: const Icon(Icons.delete, color: Colors.white, size: 30),
          onPressed: () {
            uploadImageCubit.deleteImage();
            signUpCubit.urlImage = '';
          },
        ),
      ),
    );
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }
}
