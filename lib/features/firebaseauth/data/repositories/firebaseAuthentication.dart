import 'package:bima_application/core/exceptions/expceptions.dart';
import 'package:bima_application/features/firebaseauth/data/datasources/authentication_data_source.dart';
import 'package:bima_application/features/firebaseauth/domain/repositories/authentication.dart';


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


