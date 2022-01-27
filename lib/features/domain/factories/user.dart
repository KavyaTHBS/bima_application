
import 'package:bima_application/features/domain/entities/user.dart';

class UserFactory {
  static User createUser(phoneNumber, smsCode) {
    return new User(phoneNumber, smsCode);
  }
}
