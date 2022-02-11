import 'package:bima_application/features/firebaseauth/domain/repositories/authentication.dart';
import 'package:flutter/cupertino.dart';

class VerifySmsCode {
  final AuthenticationService doctorRepository;

  VerifySmsCode(this.doctorRepository);

  Future<void> call(String smsCode) async {
    return await doctorRepository.verifySmsCode(smsCode: smsCode);
  }
}
