abstract class AuthenticationService {

  Future<void> signInWithPhoneNumber({
    required String phoneNumber,
  });
  Future<void> verifySmsCode({
    required String smsCode,
  });

}
