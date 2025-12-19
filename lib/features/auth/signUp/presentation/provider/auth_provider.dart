import 'package:e_com/core/firebase_error_handler.dart/firebase_auth_error_handler.dart';
import 'package:e_com/features/auth/signUp/domain/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository repo;
  AuthProvider(this.repo);

  bool isLoading = false;
  String error = '';
  bool isSuccess = false;

  // sign up

  Future<void> handleSignUp(String userName, String pass, String email) async {
    if (userName.isEmpty || pass.isEmpty || email.isEmpty) {
      error = 'All fields are required';
      notifyListeners();
      return;
    }
    if (isLoading) return;
    isLoading = true;
    isSuccess = false;
    error = '';
    notifyListeners();
    try {
      await repo.signUp(email, userName, pass);
      isSuccess = true;
    } on FirebaseAuthException catch (fe) {
      error = FirebaseAuthErrorHandler.signUp(fe.code);
    } catch (e) {
      error = 'Some error occured try agin later';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // sign in

  Future<void> handleSignIn(String email, String pass) async {
    if (isLoading) return;
    if (email.isEmpty || pass.isEmpty) {
      error = 'All feilds are required';
      notifyListeners();
      return;
    }

    isLoading = true;
    isSuccess = false;
    error = '';
    notifyListeners();

    try {
      await repo.signIn(email, pass);
      isSuccess = true;
    } on FirebaseAuthException catch (fe) {
     error= FirebaseAuthErrorHandler.signIn(fe.code);
      //
    } catch (e) {
      error = 'Some error occured try agin later';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // clear success
  void successreset() {
    isSuccess = false;
    notifyListeners();
  }
  //clear error

  void errorReset() {
    error = '';
    notifyListeners();
  }
}
