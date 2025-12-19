import 'package:dio/dio.dart';

class FirebaseAuthErrorHandler {
  FirebaseAuthErrorHandler._(); // no instance

  static String signUp(String code) {
    switch (code) {
      case 'email-already-in-use':
        return 'Email already exists';
      case 'weak-password':
        return 'Password is too weak';
      case 'invalid-email':
        return 'Invalid email address';
      default:
        return 'Sign up failed';
    }
  }

  static String signIn(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email';
      case 'wrong-password':
        return 'Incorrect password';
      case 'invalid-email':
        return 'Invalid email address';
      case 'user-disabled':
        return 'User account disabled';
      default:
        return 'Sign in failed';
    }
  }


  static String mapDioError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout';
    }
    if (e.type == DioExceptionType.receiveTimeout) {
      return 'Server not responding';
    }
    if (e.type == DioExceptionType.badResponse) {
      return 'Invalid response from server';
    }
    if (e.type == DioExceptionType.connectionError) {
      return 'No internet connection';
    }
    return 'Unexpected network error';
  }
}



class NetworkException implements Exception {
  final String message;
  NetworkException(this.message);
}
