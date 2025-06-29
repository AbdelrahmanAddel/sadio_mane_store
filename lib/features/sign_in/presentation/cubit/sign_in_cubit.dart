import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_pref_key.dart';
import 'package:sadio_mane_store/core/helpers/shared_prefrence/shared_prefrence.dart';

import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_request_body.dart';
import 'package:sadio_mane_store/features/sign_in/logic/usecases/get_user_role_usecase.dart';
import 'package:sadio_mane_store/features/sign_in/logic/usecases/sign_in_usecase.dart';
import 'package:sadio_mane_store/features/sign_in/presentation/cubit/sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit(this._signInUsecase, this._getUserRoleUseCase)
    : super(SignInInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignInUsecase _signInUsecase;
  final GetUserRoleUseCase _getUserRoleUseCase;
  bool isObsecure = true;

  Future<void> signInWithEmailAndPassword() async {
    emit(SignInLoading());
    final responce = await _signInUsecase.call(
      SignInRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    responce.fold((failure) => emit(SignInFailure(error: failure)), (
      success,
    ) async {
      await _saveUserToken(success.data?.login?.accessToken);
      await _checkUserRole();
    });
  }

  void changeVisiability() {
    isObsecure = !isObsecure;
    emit(ChangeVisiability());
  }

  Future<void> _saveUserToken(String? accessToken) async {
    await SharedPrefHelper.setData(SharedPrefKey.accessToken, accessToken);
  }

  Future<void> _checkUserRole() async {
    final responce = await _getUserRoleUseCase.call();

    responce.fold((error) => emit(SignInFailure(error: error)), (success) {
      SharedPrefHelper.setData(SharedPrefKey.userRole, success.role);
      emit(SignInSuccess(useRole: success.role));
    });
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
