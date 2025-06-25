import 'package:sadio_mane_store/features/sign_in/data/model/sign_in_responce_model.dart';

sealed class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  SignInSuccess(this.signInResponceModel);
  final SignInResponceModel signInResponceModel;
}

class SignInFailure extends SignInState {
  SignInFailure(this.error);
  final String error;
}

class ChangeVisiability extends SignInState {}
