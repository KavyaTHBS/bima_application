import 'package:bima_application/features/domain/entities/user.dart';
import 'package:flutter/src/widgets/framework.dart';

abstract class AuthenticationService {

  Future<void> verifyPhoneNumber(String verificationId, BuildContext context) ;
  Future<void> signInwithPhoneNumber(String verificationId, String smsCode) ;


}
