import 'package:e_com/features/auth/signUp/data/data_source/profile_data_source.dart';
import 'package:e_com/features/auth/signUp/data/model/auth_model.dart';
import 'package:e_com/features/auth/signUp/domain/auth_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepositoryImp implements AuthRepository {
  final _auth = FirebaseAuth.instance;

  @override
  Future<void> signUp(String email, String username, String password) async {
    final UserCredential cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = cred.user;
    if (user == null) {
      throw Exception('User Creation failed');
    }

    final data = AuthModel(
      uid: user.uid,
      userName: username,
      email: email,
      createdAt: DateTime.now(),
    );

    await ProfileDataSource().createUserFireStore(data);
  }

  @override
  Future<void> signIn(String email, String password) async {
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
