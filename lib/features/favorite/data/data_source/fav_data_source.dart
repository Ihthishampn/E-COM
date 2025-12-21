import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com/features/favorite/data/model/favorite_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth firebaseAuth;

  FavDataSource(this.fireStore, this.firebaseAuth);

  Future<void> addToFirebaseFavotiteProducts(FavoriteModel fav) async {
    await fireStore
        .collection("Favorites")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("items")
        .doc(fav.productId.toString())
        .set(fav.toFirbase());
  }

  Stream<List<FavoriteModel>> fetchFavProducts() {
    return fireStore
        .collection("Favorites")
        .doc(firebaseAuth.currentUser!.uid)
        .collection("items")
        .snapshots()
        .map((snaps) {
          return snaps.docs
              .map((e) => FavoriteModel.fromFirebase(e.data()))
              .toList();
        });
  }
}
