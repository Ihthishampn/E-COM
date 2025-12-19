import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier {
  int currentIndex = 0;

  void setIndex(int i) {
    currentIndex = i;
    notifyListeners();
  }
}
