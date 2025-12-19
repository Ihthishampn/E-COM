import 'package:e_com/features/Home/data/data_source/cat_fetch_data_source.dart';
import 'package:e_com/features/Home/domain/repository/category_repository.dart';

class CategoryRepoImpl implements CategoryRepository {
  final CatFetchDataSource remote;
  CategoryRepoImpl(this.remote);

  @override
  Future<List<String>> fetchCatList() async {
    try {
      return await remote.catFetchdio();
    }
    
     catch (e) {
      rethrow;
    }
  }
}
