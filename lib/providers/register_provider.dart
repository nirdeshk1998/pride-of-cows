import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/home/home_screen.dart';
import 'package:poc/screens/main/main_screen.dart';
import 'package:poc/utils/utils.dart';

final registerProvider = ChangeNotifierProvider.autoDispose((ref) => RegisterChangeProvider());

class RegisterChangeProvider with ChangeNotifier {
  bool checkState = false, otpButtonState = false;

  void onCheckFun() {
    checkState = !checkState;
    notifyListeners();
  }

  void startShoppingButton(context) {
    Utils.pushAndRemoveUntil(context, const MainScreen());
  }
}
