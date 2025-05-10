class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSucces extends LoginState {}

class LoginFailure extends LoginState {
  String message;
  LoginFailure({required this.message});
}
