abstract class AuthenticationDataSource {
  Future<void> signInWithPhoneNumber({required String phoneNumber});
  Future<void> verifySmsCode({required String smsCode});
}