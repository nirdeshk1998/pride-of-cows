import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = ChangeNotifierProvider.autoDispose<CartChangeProvider>(
  (ref) => CartChangeProvider(),
);

class CartChangeProvider extends ChangeNotifier {
  int _itemCount = 0;
  String get itemCount => _itemCount.toString();

  void onItemPlus() {
    ++_itemCount;
    notifyListeners();
  }

  void onItemMinus() {
    if (_itemCount > 0) {
      --_itemCount;
      notifyListeners();
    }
  }

  void itemAmountCounter() {
    //
  }
}
