import 'package:dio/dio.dart';
import 'package:e_com/core/firebase_error_handler.dart/firebase_auth_error_handler.dart';
import 'package:e_com/core/utils/app_state.dart';
import 'package:e_com/features/Home/data/model/popular_product_model.dart';
import 'package:e_com/features/Home/domain/repository/popular_product_repository.dart';
import 'package:flutter/widgets.dart';

class PopularProdcutsProvider extends ChangeNotifier {
  final PopularProductRepository repo;

  PopularProdcutsProvider(this.repo) {
    handlFetchOfPopularProducts();
  }
  AppState state = AppState.initial;

  String error = '';

  List<PopularProductModel> list = [];

  Future<void> handlFetchOfPopularProducts() async {
    if (state == AppState.loading) return;
    state = AppState.loading;
    error = '';
    notifyListeners();
    try {
      final res = await repo.fetchPopularProducts();
      list = res;
      state = AppState.success;
    } on DioException catch (de) {
      error = FirebaseAuthErrorHandler.mapDioError(de);
      state = AppState.error;
    } catch (e) {
      error = "try agin later.";
      state = AppState.error;
    } finally {
      notifyListeners();
    }
  }

  
}
