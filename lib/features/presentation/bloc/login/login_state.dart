

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
