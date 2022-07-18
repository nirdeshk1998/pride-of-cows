import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final vacationModeProvider = ChangeNotifierProvider<VacationModeChangeProvider>(
  (ref) => VacationModeChangeProvider(),
);

class VacationModeChangeProvider extends ChangeNotifier {
  bool _vacationMode = false;

  bool get vacationMode => _vacationMode;

  void vacationModeFun(bool i) {
    _vacationMode = i;
    notifyListeners();
  }
}
