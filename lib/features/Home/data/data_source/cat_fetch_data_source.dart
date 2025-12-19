import 'package:e_com/core/Network/dio_client.dart';

class CatFetchDataSource {
  final DioClient client;
  CatFetchDataSource(this.client);

  Future<List<String>> catFetchdio() async {
    final response = await client.dio.get('products/category-list');
    print(response.statusCode);

    final List catList = response.data;
    return catList.map((e) => e.toString()).toList();
  }
}
