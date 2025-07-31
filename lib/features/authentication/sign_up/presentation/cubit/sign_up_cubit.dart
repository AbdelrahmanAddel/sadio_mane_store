import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/data/model/sign_up_request_model.dart';
import 'package:sadio_mane_store/features/authentication/sign_up/logic/usecase/sign_up_usecase.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpUsecase) : super(SignUpInitial());
  final SignUpUsecase _signUpUsecase;
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isObserve = true;
  String urlImage = '';

  Future<void> signUpWithEmailAndPassword() async {
    emit(SignUpLoadingState());
    final responce = await _signUpUsecase.call(
      signRequestModel: SignUpRequestModel(
        fullName: fullNameController.text,
        email: emailController.text,
        password: passwordController.text,

        userAvatar: urlImage,
      ),
    );
    responce.fold(
      (error) => emit(SignUpErrorState(error: error)),
      (success) {
        emit(SignUpSuccessState());
        fullNameController.clear();
        emailController.clear();
        passwordController.clear();
        urlImage = '';
       
      },
    );
  }

  void changePasswordVisiability() {
    isObserve = !isObserve;
    emit(ChangePasswordVisiability());
  }
  

  @override
  Future<void> close() {
    fullNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    urlImage = '';

    return super.close();
  }
}
