part of 'sign_up_cubit.dart';

sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class SignUpLoadingState extends SignUpState {}

final class SignUpSuccessState extends SignUpState {}

final class SignUpErrorState extends SignUpState {
  SignUpErrorState({required this.error});
  final String error;
}

final class ChangePasswordVisiability extends SignUpState {}

