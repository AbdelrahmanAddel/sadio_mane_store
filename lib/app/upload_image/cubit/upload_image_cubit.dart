import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sadio_mane_store/app/upload_image/data/model/upload_image_responce_model.dart';
import 'package:sadio_mane_store/app/upload_image/logic/usecase/upload_image_usecase.dart';
import 'package:sadio_mane_store/core/common/image_picker.dart';

part 'upload_image_state.dart';

class UploadImageCubit extends Cubit<UploadImageState> {
  UploadImageCubit(this._imageUsecase, this.imagePickerClass)
    : super(UploadImageInitialState());
  final UploadImageUsecase _imageUsecase;
  final ImagePickerClass imagePickerClass;
  String? imageUrl = '';

  Future<XFile?> pickImageFromGallery() async {
    final pickImage = await imagePickerClass.pickImage();
    if (pickImage == null) {
      emit(FailureToPickImageState(message: 'failed to pick image'));
      return null;
    } else {
      emit(PickImageSuccessState());
      return pickImage;
    }
  }

  Future<void> getImageUrl(XFile image) async {
    emit(UploadImageLoadingState());

    final response = await _imageUsecase.call(image);
    if(isClosed)return;
    response.fold((error) => emit(UploadImageErrorState(message: error)), (
      success,
    ) {
      imageUrl = success.location;
      emit(UploadImageSuccessState(success));
    });
  }

  Future<void> pickImageAndUpload() async {
    final image = await pickImageFromGallery();
    if (image != null) {
      await getImageUrl(image);
    }
  }

  void deleteImage() => emit(UploadImageInitialState());
}
