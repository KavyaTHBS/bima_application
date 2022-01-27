import 'package:bima_application/core/exceptions/expceptions.dart';
import 'package:bima_application/features/domain/entities/user.dart'as UserEntity;
import 'package:bima_application/features/domain/factories/user.dart' ;
import 'package:bima_application/features/domain/repositories/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthentication implements AuthenticationService {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<UserEntity.User> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return UserFactory.createUser(email, userCredential.user?.displayName);
    } catch (e) {
      throw UserNotFound(e.toString());
    }
  }
}
