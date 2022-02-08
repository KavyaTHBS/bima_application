part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class PhoneAuthNumberVerified extends LoginEvent {
  final String phoneNumber;
  const PhoneAuthNumberVerified({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}


class DoLogin extends LoginEvent {
  final String phoneNumber="";
  final String smsCode="";

  DoLogin({ phoneNumber, smsCode});

  @override
  List<Object> get props => [phoneNumber, smsCode];
}
class PhoneAuthCodeAutoRetrevalTimeout extends LoginEvent {
  final String verificationId;
  const PhoneAuthCodeAutoRetrevalTimeout(this.verificationId);
  @override
  List<Object> get props => [verificationId];
}
class PhoneAuthCodeVerified extends LoginEvent {
  final String smsCode;
  const PhoneAuthCodeVerified({
    required this.smsCode,
  });

  @override
  List<Object> get props => [smsCode];
}
class PhoneAuthCodeSent extends LoginEvent {
  final String verificationId;
  final int? token;
  const PhoneAuthCodeSent({
    required this.verificationId,
    required this.token,
  });

  @override
  List<Object> get props => [verificationId];
}

class PhoneAuthVerificationFailed extends LoginEvent {
  final String message;

  const PhoneAuthVerificationFailed(this.message);
  @override
  List<Object> get props => [message];
}

class PhoneAuthVerificationCompleted extends LoginEvent {
  final String uid;
  const PhoneAuthVerificationCompleted(this.uid);
  @override
  List<Object> get props => [uid];
}
