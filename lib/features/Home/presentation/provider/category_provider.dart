import 'package:e_com/core/utils/app_state.dart';
import 'package:e_com/features/Home/data/model/cat_product_model.dart';
import 'package:e_com/features/Home/domain/repository/category_repository.dart';
import 'package:flutter/material.dart';
class CategoryProvider extends ChangeNotifier {
  final CategoryRepository repo;

  CategoryProvider(this.repo) {
    init();
  }

  /// category state
  AppState catState = AppState.initial;
  List<String> catList = [];
  String selectedCat = '';

  /// product state
  bool isProductsLoading = false;
  List<CatProductModel> catBasedList = [];

  /// errors
  String catError = '';
  String productError = '';

  /// cache
  final Map<String, List<CatProductModel>> _productCache = {};

  Future<void> init() async {
    await fetchCategories();
  }

  Future<void> fetchCategories() async {
    if (catState == AppState.loading) return;

    catState = AppState.loading;
    notifyListeners();

    try {
      catList = await repo.fetchCatList();

      if (catList.isNotEmpty) {
        selectedCat = catList.first;
        await fetchProducts(selectedCat);
      }

      catState = AppState.success;
    } catch (e) {
      catError = e.toString();
      catState = AppState.error;
    } finally {
      notifyListeners();
    }
  }

  void changeCat(String newCat) {
    if (newCat == selectedCat) return;

    selectedCat = newCat;
    fetchProducts(newCat);
  }

  Future<void> fetchProducts(String category) async {
    // cache hit
    if (_productCache.containsKey(category)) {
      catBasedList = _productCache[category]!;
      notifyListeners();
      return;
    }

    isProductsLoading = true;
    productError = '';
    notifyListeners();

    try {
      final products = await repo.fetchCatProduct(category);
      _productCache[category] = products;
      catBasedList = products;
    } catch (e) {
      productError = e.toString();
    } finally {
      isProductsLoading = false;
      notifyListeners();
    }
  }
}
