import 'package:bima_application/features/domain/entities/user.dart';
import 'package:bima_application/features/domain/repositories/authentication.dart';
import 'package:flutter/cupertino.dart';

class SignInUseCase {
  AuthenticationService authenticationService;

  SignInUseCase(this.authenticationService);

  // Future<User> call(String phoneNumber, String smsCode) async {
  //   return await authenticationService.signIn(phoneNumber, phoneNumber);
  // }
  Future<void> call(String verificationId,String smsCode) async {
    return await authenticationService.signInwithPhoneNumber(verificationId,smsCode);
  }
}
