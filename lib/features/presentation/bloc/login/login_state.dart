

part of 'login_bloc.dart';


abstract class LoginState extends Equatable {
   const LoginState();

  @override
  List<Object> get props => [];
}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
   String errorMessage;

  LoginFailure(this.errorMessage);
}
class AuthCodeVerifiedState extends LoginState {}

class AuthLoggedInState extends LoginState {}
class AuthInitialState extends LoginState {}

class AuthLoadingState extends LoginState {}

class AuthCodeSentState extends LoginState {}
class AuthErrorState extends LoginState {
  final String error;
  const AuthErrorState(this.error);


}
