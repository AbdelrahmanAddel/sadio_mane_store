part of 'upload_image_cubit.dart';

sealed class UploadImageState {}

class UploadImageInitialState extends UploadImageState {}

class UploadImageSuccessState extends UploadImageState {
  UploadImageSuccessState(this.imageResponce);

  UploadImageResponceModel imageResponce;
}

class UploadImageLoadingState extends UploadImageState {}

class UploadImageErrorState extends UploadImageState {
  UploadImageErrorState({required this.message});
  final String message;
}

class FailureToPickImageState extends UploadImageState {
  FailureToPickImageState({required this.message});
  final String message;
}

class PickImageSuccessState extends UploadImageState {}
