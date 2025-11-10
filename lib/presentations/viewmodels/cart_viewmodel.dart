import 'package:flutter/material.dart';
import '../../data/models/menu.dart';

class CartViewModel extends ChangeNotifier {
  Map<Menu, int> items = {};

  double get totalPrice => items.entries.fold(
    0,
    (sum, entry) => sum + entry.key.price * entry.value,
  );

  void add(Menu menu) {
    if (items.containsKey(menu)) {
      items[menu] = items[menu]! + 1;
    } else {
      items[menu] = 1;
    }
    notifyListeners();
  }

  void remove(Menu menu) {
    if (items.containsKey(menu)) {
      if (items[menu]! > 1) {
        items[menu] = items[menu]! - 1;
      } else {
        items.remove(menu);
      }
      notifyListeners();
    }
  }

  // ✨ Tambahkan method clear
  void clear() {
    items.clear();
    notifyListeners();
  }
}
