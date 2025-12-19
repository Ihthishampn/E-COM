import 'package:e_com/core/utils/app_state.dart';
import 'package:e_com/features/Home/data/popular_repository_impl/category_repo_impl.dart';
import 'package:flutter/material.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryRepoImpl repoImpl;

  CategoryProvider(this.repoImpl) {
    handleCatFetch();
  }
  AppState state = AppState.initial;
  String error = '';
  List<String> catList = [];
  String selectedCat = "";

  Future<void> handleCatFetch() async {
    if (state == AppState.loading) return;
    state = AppState.loading;
    error = '';
    notifyListeners();
    try {
      final cat = await repoImpl.fetchCatList();

      catList = cat;
      if (catList.isNotEmpty) {
        selectedCat = catList.first;
      }
      state = AppState.success;
    } catch (e) {
      state = AppState.error;
      error = e.toString();
      print("cat list errorrrrrrrr $e");
    } finally {
      notifyListeners();
    }
  }

  void changeCat(String newCat) {
    if (newCat == selectedCat) return;
    selectedCat = newCat;
    notifyListeners();
  }
}
