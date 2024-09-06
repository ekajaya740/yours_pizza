import 'package:flutter/material.dart';

class PizzaToppingsProvider extends ChangeNotifier {
  List<Map<String, Object>>? toppings;
  int toppingsValue = 0;

  final _allToppings = [
    {"name": "avocado", "price": 1, "checked": false},
    {"name": "broccoli", "price": 1, "checked": false},
    {"name": "onions", "price": 1, "checked": false},
    {"name": "zucchini", "price": 1, "checked": false},
    {"name": "tuna", "price": 2, "checked": false},
    {"name": "ham", "price": 3, "checked": false},
    {"name": "lobster", "price": 2, "checked": false},
    {"name": "oyster", "price": 2, "checked": false},
    {"name": "salmon", "price": 2, "checked": false},
    {"name": "bacon", "price": 2, "checked": false},
    {"name": "duck", "price": 2, "checked": false},
    {"name": "sausage", "price": 3, "checked": false}
  ];

  void setPizza1Topping() {
    toppings = _allToppings
        .where(
          (item) =>
              item['name'] == 'avocado' ||
              item['name'] == 'broccoli' ||
              item['name'] == 'onions' ||
              item['name'] == 'zucchini' ||
              item['name'] == 'tuna' ||
              item['name'] == 'ham',
        )
        .toList();

    notifyListeners();

    toppingsValue = toppings!
        .where((item) => item['checked'] as bool == true)
        .map((item) => item['price'] as int)
        .reduce((a, b) => a + b);

    notifyListeners();
  }

  void setPizza2Topping() {
    toppings = _allToppings
        .where(
          (item) =>
              item['name'] == 'broccoli' ||
              item['name'] == 'onions' ||
              item['name'] == 'zucchini' ||
              item['name'] == 'lobster' ||
              item['name'] == 'oyster' ||
              item['name'] == 'salmon' ||
              item['name'] == 'bacon' ||
              item['name'] == 'ham',
        )
        .toList();

    notifyListeners();

    toppingsValue = toppings!
        .where((item) => item['checked'] as bool == true)
        .map((item) => item['price'] as int)
        .reduce((a, b) => a + b);

    notifyListeners();
  }

  void setPizza3Topping() {
    toppings = _allToppings
        .where(
          (item) =>
              item['name'] == 'broccoli' ||
              item['name'] == 'onions' ||
              item['name'] == 'zucchini' ||
              item['name'] == 'tuna' ||
              item['name'] == 'bacon' ||
              item['name'] == 'duck' ||
              item['name'] == 'ham' ||
              item['name'] == 'sausage',
        )
        .toList();

    notifyListeners();

    toppingsValue = toppings!
        .where((item) => item['checked'] as bool == true)
        .map((item) => item['price'] as int)
        .reduce((a, b) => a + b);

    notifyListeners();
  }

  void setChecked(String name, bool checked) {
    int index = _allToppings.indexWhere((item) => item['name'] == name);

    if (index != -1) {
      _allToppings[index]['checked'] = checked;
    }

    toppingsValue = toppings!
        .where((item) => item['checked'] as bool == true)
        .map((item) => item['price'] as int)
        .reduce((a, b) => a + b);

    notifyListeners();
  }
}
