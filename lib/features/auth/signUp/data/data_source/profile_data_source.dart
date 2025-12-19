import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/features/auth/signUp/data/model/auth_model.dart';

class ProfileDataSource {
  final _db = FirebaseFirestore.instance;

  Future<void> createUserFireStore(AuthModel userModel) async {
    await _db
        .collection('Users')
        .doc(userModel.uid)
        .set(userModel.toFirebase());
  }
}
