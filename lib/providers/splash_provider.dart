import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/onboarding/onboarding_screen.dart';
import 'package:poc/utils/utils.dart';

final splashProvider = ChangeNotifierProvider.autoDispose((ref) => SplashChangeProvider());

class SplashChangeProvider with ChangeNotifier {
  Future<void> splashTimer(context) async {
   await Future.delayed(const Duration(seconds: 3), () {
      Utils.pushReplacement(context, const OnBoardingScreen());
    });
  }
}
