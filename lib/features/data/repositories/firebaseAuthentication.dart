import 'package:bima_application/core/exceptions/expceptions.dart';
import 'package:bima_application/features/domain/entities/user.dart'as UserEntity;
import 'package:bima_application/features/domain/factories/user.dart' ;
import 'package:bima_application/features/domain/repositories/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class FirebaseAuthentication implements AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<void> verifyPhoneNumber(String phoneNumber,BuildContext context) async {
    print('phoneNumber: $phoneNumber');
    PhoneVerificationCompleted verificationCompleted = (
        PhoneAuthCredential phoneAuthCredential) async {
      showSnackBar(context, "Verification completed");
    };
    PhoneVerificationFailed verificationFailed = (FirebaseAuthException exception) {
      showSnackBar(context, exception.toString());

    };
    PhoneCodeSent codeSent =
        (String? verificationID, int? forceResendingtoken) {
      showSnackBar(context, "Verification code sent on the phone number");
      // setData(verificationID);

    } as PhoneCodeSent;
    PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout = (
        String verficationID) {
      showSnackBar(context, "Verification code sent on the phone number");


    };
    try {
      await auth.verifyPhoneNumber(phoneNumber: phoneNumber,
          verificationCompleted: verificationCompleted,
          verificationFailed: verificationFailed,
          codeSent: codeSent,
          codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
      print('codesent: $codeSent');

    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  @override
  Future<void>signInwithPhoneNumber(String verificationId,String smsCode) async{
    try{
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential = await auth.signInWithCredential(credential);
      //storeTokenAndData(userCredential);
      //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>TestClass()), (route) => false);
    }catch(e){
      print(e.toString());
    }
  }


 /* @override
  Future<UserEntity.User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return UserFactory.createUser(email, userCredential.user?.displayName);
    } catch (e) {
      throw UserNotFound(e.toString());
    }
  }*/
  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Future<UserEntity.User> signIn(String phoneNumber, String smsCode) {
    // TODO: implement signIn
    throw UnimplementedError();
  }
}
