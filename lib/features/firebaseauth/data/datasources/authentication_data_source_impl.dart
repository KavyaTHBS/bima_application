import 'package:firebase_auth/firebase_auth.dart';

import 'authentication_data_source.dart';

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  String _verificationId = '';
  final FirebaseAuth auth;

  AuthenticationDataSourceImpl(this.auth);

  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) async {
    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationCompleted phoneVerificationCompleted =
        (AuthCredential authCredential) {
    };

    // ignore: prefer_function_declarations_over_variables
    final PhoneVerificationFailed phoneVerificationFailed =
        (FirebaseAuthException firebaseAuthException) {

    };
    // ignore: prefer_function_declarations_over_variables
    final PhoneCodeAutoRetrievalTimeout phoneCodeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
         };
    // ignore: prefer_function_declarations_over_variables
    final PhoneCodeSent phoneCodeSent =
        (String verificationId, [int? forceResendingToken]) {};

    // await auth.verifyPhoneNumber(
    //   phoneNumber: phoneNumber,
    //   verificationCompleted: phoneVerificationCompleted,
    //   verificationFailed: phoneVerificationFailed,
    //   timeout: const Duration(seconds: 60),
    //   codeSent: phoneCodeSent,
    //   codeAutoRetrievalTimeout: phoneCodeAutoRetrievalTimeout,
    // );

    await  auth.signInWithPhoneNumber(
        phoneNumber,
       /* RecaptchaVerifier(
          container: 'recaptcha',
          size: RecaptchaVerifierSize.compact,
          theme: RecaptchaVerifierTheme.dark,
        )*/);

     /*ConfirmationResult confirmationResult =
     await auth.signInWithPhoneNumber(phoneNumber);*/
    //
    //
  }

  @override
  Future<void> verifySmsCode({required String smsCode}) async {
    final AuthCredential authCredential = PhoneAuthProvider.credential(
        verificationId: _verificationId, smsCode: smsCode);
    await auth.signInWithCredential(authCredential);
  }
}
