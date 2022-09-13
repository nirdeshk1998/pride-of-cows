
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/cart/cart_summary.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final cartProvider = ChangeNotifierProvider.autoDispose<CartChangeProvider>(
  (ref) => CartChangeProvider(),
);

class CartChangeProvider extends ChangeNotifier {

  int _itemCount = 0;
  String get itemCount => _itemCount.toString();

  bool showItems=false;

  String? userId;

  // Future<void> _gettingPrefs(context)async{
  //   userId=await LocalStorage.getString(StorageField.userId);
  //   notifyListeners();
  // }










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

  void showAndHideItems(){
    showItems=!showItems;
    notifyListeners();
  }

}
