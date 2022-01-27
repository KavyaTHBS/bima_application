import 'package:bima_application/features/domain/entities/user.dart';
import 'package:bima_application/features/domain/repositories/authentication.dart';

class SignInUseCase {
  AuthenticationService authenticationService;

  SignInUseCase(this.authenticationService);

  Future<User> call(String email, String password) async {
    return await authenticationService.signIn(email, password);
  }
}
