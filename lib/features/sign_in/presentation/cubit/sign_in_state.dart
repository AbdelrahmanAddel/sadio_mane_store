sealed class SignInState {}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  SignInSuccess({this.useRole});
  final String? useRole;
}

class SignInFailure extends SignInState {
  SignInFailure({this.error});

  final String? error;
}

class ChangeVisiability extends SignInState {}
