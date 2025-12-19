import 'package:e_com/core/Network/dio_client.dart';
import 'package:e_com/features/Home/data/model/cat_product_model.dart';

class CatFetchDataSource {
  final DioClient client;
  CatFetchDataSource(this.client);

  Future<List<String>> catFetchdio() async {
    final response = await client.dio.get('products/category-list');
    print(response.statusCode);

    final List catList = response.data;
    return catList.map((e) => e.toString()).toList();
  }

  Future<List<CatProductModel>> catProductFetchDio(String q) async {
    final response = await client.dio.get("products/category/$q");

    print("cat pro ${response.statusCode}");

    final List pro = response.data["products"];

    return pro.map((e) => CatProductModel.fromJson(e)).toList();
  }
}
