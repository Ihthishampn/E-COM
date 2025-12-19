import 'package:e_com/features/Home/data/data_source/dio_popular_fetch.dart';
import 'package:e_com/features/Home/data/model/popular_product_model.dart';
import 'package:e_com/features/Home/domain/repository/popular_product_repository.dart';

class PopularRepoImpl implements PopularProductRepository {
    final DioPopularFetchDataSource dataSource;
  PopularRepoImpl(this.dataSource);

  @override
  Future<List<PopularProductModel>> fetchPopularProducts() async {
    try {
      return await dataSource.fetchPopularProducts();
    }
    
     catch (e) {
      rethrow;
    }
  }
}
