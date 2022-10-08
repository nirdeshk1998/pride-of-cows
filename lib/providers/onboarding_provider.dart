import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/authentication/login_screen.dart';
import 'package:poc/utils/utils.dart';

final onBoardingProvider = ChangeNotifierProvider.autoDispose((ref) => OnBoardingChangeProvider());

class OnBoardingChangeProvider with ChangeNotifier {
  final PageController pageController = PageController(initialPage: 0);
  double selectedDot = 0;

  void onNextButton(context) {
    if (pageController.page! <= 1.0) {
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
      ++selectedDot;
      notifyListeners();
    } else {
      Utils.pushReplacement(context, const LoginScreen());
    }
  }

  void onSkipButton(context) {
    Utils.pushReplacement(context, const LoginScreen());
  }

  VoidCallback? onSwipe(int? index) {
    if (index == 0) {
      selectedDot = 0;
    }
    if (index == 1) {
      selectedDot = 1;
    }
    if (index == 2) {
      selectedDot = 2;
    }
    notifyListeners();
    return null;
  }
}
              