import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Navigation { home, products, cart, menu }

final mainProvider = ChangeNotifierProvider.autoDispose<MainChangeProvider>(
  (ref) => MainChangeProvider(),
);

class MainChangeProvider extends ChangeNotifier {
  int currentIndex = Navigation.home.index;

  void onMenuTapped(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
