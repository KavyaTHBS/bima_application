import 'package:bima_application/features/domain/entities/user.dart';

abstract class AuthenticationService {
  Future<User> signIn(String email, String password);
}
