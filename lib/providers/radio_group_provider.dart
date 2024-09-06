import 'package:flutter/material.dart';

class RadioGroupProvider<T> extends ChangeNotifier {
  T? selectedOpts;

  void setDefaultValue(T value) {
    if (selectedOpts == null) {
      selectedOpts = value;
      notifyListeners();
    }
  }

  void changeSelected(T value) {
    if (selectedOpts != value) {
      selectedOpts = value;
      notifyListeners();
    }
  }
}
