import 'package:e_com/features/Home/data/model/cat_product_model.dart';

abstract class CategoryRepository {
  Future<List<String>> fetchCatList();
  Future<List<CatProductModel>> fetchCatProduct(String q);
}
