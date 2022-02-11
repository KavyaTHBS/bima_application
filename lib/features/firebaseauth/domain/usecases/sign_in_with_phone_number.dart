import 'package:bima_application/features/firebaseauth/domain/repositories/authentication.dart';

class SignInWithPhoneNumber {
  final AuthenticationService doctorRepository;

  SignInWithPhoneNumber(this.doctorRepository);

  Future<void> call(String phoneNumber) {
    return doctorRepository.signInWithPhoneNumber(phoneNumber: phoneNumber);
  }
}
