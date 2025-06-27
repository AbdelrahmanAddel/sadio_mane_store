import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/app/upload_image/cubit/upload_image_cubit.dart';

class SignUpCircleAvatar extends StatelessWidget {
  const SignUpCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final uploadImageCubit = context.read<UploadImageCubit>();

    return GestureDetector(
      onTap: () async {
        final image = await uploadImageCubit.pickImageFromGallery();
        await uploadImageCubit.getImageUrl(image!);
      },
      child: const CircleAvatar(
        radius: 40,
        child: Icon(Icons.person, size: 50),
      ),
    );
  }
}
