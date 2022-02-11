import 'package:bima_application/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void>signInwithPhoneNumber(String verificationId,String smsCode,BuildContext context) async{
    try{
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      //storeTokenAndData(userCredential);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (builder)=>TestClass()), (route) => false);
      showSnackBar(context, "Logged in");
    }catch(e){
      showSnackBar(context, e.toString());
    }
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}