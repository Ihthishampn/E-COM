import 'package:e_com/features/favorite/data/model/favorite_model.dart';

abstract class FavoriteRepository {
  // add

  Future<void> addFavoriteToFirebaseCollection(FavoriteModel fav);

  Stream<List<FavoriteModel>> getFavFromFirebaseDataBase();
}
