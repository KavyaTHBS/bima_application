import 'package:bima_application/core/exceptions/expceptions.dart';
import 'package:bima_application/features/data/datasources/auth_data/authentication_data_source.dart';
import 'package:bima_application/features/domain/entities/user.dart'as UserEntity;
import 'package:bima_application/features/domain/factories/user.dart' ;
import 'package:bima_application/features/domain/repositories/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../main.dart';

class FirebaseAuthentication implements AuthenticationService {
  final AuthenticationDataSource dataSource;

  FirebaseAuthentication(this.dataSource);

  @override
  Future<void> signInWithPhoneNumber({required String phoneNumber}) async =>
      await dataSource.signInWithPhoneNumber(phoneNumber: phoneNumber);

  @override
  Future<void> verifySmsCode({required String smsCode}) async =>
      await dataSource.verifySmsCode(smsCode: smsCode);
}


