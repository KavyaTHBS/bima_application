import 'package:bima_application/features/domain/entities/user.dart';
import 'package:flutter/src/widgets/framework.dart';

abstract class AuthenticationService {

  Future<void> signInWithPhoneNumber({
    required String phoneNumber,
  });
  Future<void> verifySmsCode({
    required String smsCode,
  });

}
