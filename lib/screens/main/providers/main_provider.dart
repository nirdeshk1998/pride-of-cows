import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainProvider = ChangeNotifierProvider.autoDispose<MainChangeProvider>(
  (ref) => MainChangeProvider(),
);

class MainChangeProvider extends ChangeNotifier {
  int currentIndex = 0;

  void onMenuTapped(int value) {
    currentIndex = value;
    notifyListeners();
  }
}
