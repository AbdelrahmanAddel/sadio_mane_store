import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_request_body.dart';
import 'package:sadio_mane_store/features/sign_in/logic/usecases/sign_in_usecase.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInUsecase) : super(SignInInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignInUsecase _signInUsecase;
  bool isObsecure = true;
  Future<void> signInWithEmailAndPassword() async {
    emit(SignInLoading());
    final responce = await _signInUsecase.call(
      SignInRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    responce.fold(
      (failure) => emit(SignInFailure(failure)),
      (success) => emit(SignInSuccess(success)),
    );
  }

  void changeVisiability() {
    isObsecure = !isObsecure;
    emit(ChangeVisiability());
  }

  String? Function(String?)? textFormFieldValidator(String field) {
    switch (field) {
      case 'email':
        return (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your email';
          }
          return null;
        };
      case 'password':
        return (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your password';
          } else if (value.length < 6) {
            return 'Password must be at least 6 characters';
          }
          return null;
        };
    }

    return null;
  }
}
