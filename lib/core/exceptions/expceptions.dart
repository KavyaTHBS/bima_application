

class CacheException implements Exception{}

class UserNotFound implements Exception {
  final String message;

  UserNotFound(this.message);
}
