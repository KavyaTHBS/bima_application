part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class DoLogin extends LoginEvent {
  final String phoneNumber="";
  final String smsCode="";

  DoLogin({ phoneNumber, smsCode});

  @override
  List<Object> get props => [phoneNumber, smsCode];
}
