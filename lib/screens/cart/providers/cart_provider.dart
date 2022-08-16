
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/cart/cart_summary.dart';
import 'package:poc/utils/utils.dart';

final cartProvider = ChangeNotifierProvider.autoDispose<CartChangeProvider>(
  (ref) => CartChangeProvider(),
);

class CartChangeProvider extends ChangeNotifier {
  int _itemCount = 0;
  String get itemCount => _itemCount.toString();
  String appliedOffer="";
  bool showItems=false;

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
  void onApplyOffer(String value,context){
    appliedOffer=value;
    Utils.push(context,  CartSummary());
    notifyListeners();

  }
  void onRemoveOffer(){
    appliedOffer="";
    notifyListeners();

  }
  void showAndHideItems(){
    showItems=!showItems;
    notifyListeners();

  }
}
