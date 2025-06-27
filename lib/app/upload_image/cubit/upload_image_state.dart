part of 'upload_image_cubit.dart';

sealed class UploadImage {}

class UploadImageInitialState extends UploadImage {}

class UploadImageSuccessState extends UploadImage {
  UploadImageSuccessState(this.imageResponce);

  UploadImageResponceModel imageResponce;
}

class UploadImageLoadingState extends UploadImage {}

class UploadImageErrorState extends UploadImage {
  UploadImageErrorState({required this.message});
  final String message;
}

class FailureToPickImageState extends UploadImage {
  FailureToPickImageState({required this.message});
  final String message;
}

class PickImageSuccessState extends UploadImage {}
