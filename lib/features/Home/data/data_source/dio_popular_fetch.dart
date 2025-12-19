import 'package:e_com/core/Network/api_end_points.dart';
import 'package:e_com/core/Network/dio_client.dart';
import 'package:e_com/features/Home/data/model/popular_product_model.dart';

class DioPopularFetchDataSource {
  final DioClient dioClient;

  DioPopularFetchDataSource(this.dioClient);

  Future<List<PopularProductModel>> fetchPopularProducts() async {
    final response = await dioClient.dio.get(
      ApiEndPoints.popularProducts,queryParameters: {'limit':10,'skip':100},
    );
    print(response.statusCode);
    final List products = response.data['products'];

    return products.map((e) => PopularProductModel.fromJson(e)).toList();
  }
}
