import 'package:e_com/features/Home/data/model/popular_product_model.dart';

abstract class PopularProductRepository {
  Future<List<PopularProductModel>> fetchPopularProducts();
}
