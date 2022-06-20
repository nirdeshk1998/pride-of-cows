import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/authentication/register_screen.dart';
import 'package:poc/utils/utils.dart';

final loginProvider = ChangeNotifierProvider.autoDispose((ref) => LoginChangeProvider());

class LoginChangeProvider with ChangeNotifier {
  bool checkState = false, otpButtonState = false;

  final TextEditingController numberController = TextEditingController();

  void onSendOtpButton(context){
    Utils.push(context, const RegisterScreen());
  }

  void onCheckFun() {
    checkState = !checkState;
    notifyListeners();
  }

  void onChangedFun(String value) {
    if (value.length == 10) {
      otpButtonState = true;
    } else {
      otpButtonState = false;
    }
    notifyListeners();
  }
}
