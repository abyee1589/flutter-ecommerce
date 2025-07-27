// lib/exceptions/ab_auth_exceptions.dart

class AbFirebaseAuthException implements Exception {
  final String code;
  late final String message;

  AbFirebaseAuthException(this.code) {
    message = _getMessageFromCode(code);
  }

  String _getMessageFromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already in use. Try another.';
      case 'invalid-email':
        return 'The email address is badly formatted.';
      case 'operation-not-allowed':
        return 'This operation is not allowed.';
      case 'weak-password':
        return 'Password is too weak. Use a stronger one.';
      case 'user-disabled':
        return 'This user has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      default:
        return 'Authentication failed. [$code]';
    }
  }

  @override
  String toString() => 'AbFirebaseAuthException: $message';
}

class AbFirebaseException implements Exception {
  final String code;
  late final String message;

  AbFirebaseException(this.code) {
    message = _getMessageFromCode(code);
  }

  String _getMessageFromCode(String code) {
    switch (code) {
      case 'network-request-failed':
        return 'Network error. Please check your connection.';
      case 'permission-denied':
        return 'You do not have permission to access this.';
      default:
        return 'A Firebase error occurred. [$code]';
    }
  }

  @override
  String toString() => 'AbFirebaseException: $message';
}

class AbPlatformException implements Exception {
  final String code;
  late final String message;

  AbPlatformException(this.code) {
    message = _getMessageFromCode(code);
  }

  String _getMessageFromCode(String code) {
    switch (code) {
      case 'channel-error':
        return 'A platform error occurred.';
      default:
        return 'Platform exception occurred. [$code]';
    }
  }

  @override
  String toString() => 'AbPlatformException: $message';
}

class AbFormatException implements Exception {
  final String message;

  AbFormatException([this.message = 'Badly formatted input.']);

  @override
  String toString() => 'AbFormatException: $message';
}
