import 'package:e_com/features/favorite/data/data_source/fav_data_source.dart';
import 'package:e_com/features/favorite/data/model/favorite_model.dart';
import 'package:e_com/features/favorite/domain/repository/favorite_repository.dart';

class FavRepositoryImpl implements FavoriteRepository {
  final FavDataSource remote;
  FavRepositoryImpl(this.remote);

  @override
  Future<void> addFavoriteToFirebaseCollection(FavoriteModel fav) async {
    try {
      await remote.addToFirebaseFavotiteProducts(fav);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<List<FavoriteModel>> getFavFromFirebaseDataBase(){
    return  remote.fetchFavProducts();
  }
}
