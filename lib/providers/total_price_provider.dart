import 'package:flutter/material.dart';

class TotalPriceProvider extends ChangeNotifier {
  int total = 0;

  void setTotal(int variant, int size, int topping) {
    total = variant + size + topping;
    notifyListeners();
  }
}
