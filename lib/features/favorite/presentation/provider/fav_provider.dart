import 'package:e_com/core/utils/app_state.dart';
import 'package:e_com/features/favorite/data/model/favorite_model.dart';
import 'package:e_com/features/favorite/domain/repository/favorite_repository.dart';
import 'package:flutter/material.dart';

class FavProvider extends ChangeNotifier {
  final FavoriteRepository repo;
  FavProvider(this.repo) {
    handleGetFav();
  }

  AppState state = AppState.initial;
  bool isSuccess = false;
  String error = '';
  bool isSelect = false;
  Future<void> handleFavAddToFirebase(FavoriteModel fav) async {
    if (state == AppState.loading) return;

    isSuccess = false;
    state = AppState.loading;
    error = '';
    notifyListeners();
    try {

      await repo.addFavoriteToFirebaseCollection(fav);
      state = AppState.success;
      print("Success");
    } catch (e) {
      state = AppState.error;

      error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  // get fav...

  Stream<List<FavoriteModel>> handleGetFav() {
    return repo.getFavFromFirebaseDataBase().handleError((e) {
    });
  }
}
