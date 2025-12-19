import 'package:e_com/features/Home/data/data_source/cat_fetch_data_source.dart';
import 'package:e_com/features/Home/data/model/cat_product_model.dart';
import 'package:e_com/features/Home/domain/repository/category_repository.dart';

class CategoryRepoImpl implements CategoryRepository {
  final CatFetchDataSource remote;
  CategoryRepoImpl(this.remote);

  @override
  Future<List<String>> fetchCatList() async {
    try {
      return await remote.catFetchdio();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<CatProductModel>> fetchCatProduct(String q) async {
    try {
      return await remote.catProductFetchDio(q);
    } catch (e) {
      rethrow;
    }
  }
}
