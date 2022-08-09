import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/authentication/register_screen.dart';
import 'package:poc/utils/utils.dart';

final loginProvider = ChangeNotifierProvider.autoDispose((ref) => LoginChangeProvider());

class LoginChangeProvider with ChangeNotifier {
  final TextEditingController _numberController = TextEditingController();
  TextEditingController get numberController => _numberController;

  bool _tcToggle = false, _otpButtonState = false, _isOTPSent = false;
  bool get tcToggle => _tcToggle;
  bool get isNumberValid => _otpButtonState;
  bool get isOtpSent => _isOTPSent;

  void onSendOtpButton(context) {}

  void onTcTappedFun() {
    _tcToggle = !_tcToggle;
    notifyListeners();
  }

  void onChangedFun(String value) {
    if (value.length == 10) {
      _otpButtonState = true;
    } else {
      _otpButtonState = false;
    }
    notifyListeners();
  }
}
