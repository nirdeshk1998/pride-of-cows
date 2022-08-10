import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/authentication/data/login_repository.dart';
import 'package:poc/screens/authentication/data/models/login_model.dart';
import 'package:poc/screens/authentication/data/models/otp_model.dart';
import 'package:poc/screens/authentication/register_screen.dart';
import 'package:poc/screens/main/main_screen.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';

final loginProvider = ChangeNotifierProvider.autoDispose((ref) => LoginChangeProvider());

class LoginChangeProvider with ChangeNotifier {
  final LoginRepository _loginRepo = LoginRepository();

  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();

  bool _tcToggle = false;
  bool _isNumberValid = false;
  bool _isOtpValid = false;
  bool _isOTPSent = false;
  bool _isLoading = false;

  String? _deviceName;
  String? _deviceOs;
  String? _deviceOsVersion;

  String? _receivedOtp;
  int? _isNewUser;

  TextEditingController get numberController => _numberController;
  TextEditingController get otpController => _otpController;
  bool get tcToggle => _tcToggle;
  bool get isNumberValid => _isNumberValid;
  bool get isOtpValid => _isOtpValid;
  bool get isOtpSent => _isOTPSent;
  bool get isLoading => _isLoading;

  void showLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void onSendOtpButton(context) async {
    if (!_checkValidationFun(context)) return;

    showLoader(true);
    _isOTPSent = false;
    await _getDeviceInfoFun();
    await loginOtpRequest(context);
    _isOTPSent = true;
    showLoader(false);
  }

  Future<void> onVerifyButton(context) async {
    if (!_checkValidationFun(context)) return;

    showLoader(true);
    await otpVerificationRequest(context);

    await Utils.pushReplacement(
      context,
      (_isNewUser == UserType.guest.index) ? const RegisterScreen() : const MainScreen(),
    );

    showLoader(false);
  }

  Future<void> loginOtpRequest(context) async {
    final result = await _loginRepo.sendOtpRepo(_loginReqModel);
    _receivedOtp = result.otp.toString();
    _isNewUser = result.isNew;
    Utils.showPrimarySnackbar(context, result.message);
  }

  Future<void> otpVerificationRequest(context) async {
    final result = await _loginRepo.verifyOtpRepo(_otpReqModel);
    Utils.showPrimarySnackbar(context, result.message);
  }

  OtpReqModel get _otpReqModel => OtpReqModel(
        mobileNo: _numberController.text,
        otp: _otpController.text,
      );

  LoginReqModel get _loginReqModel => LoginReqModel(
        mobileNo: _numberController.text,
        fCMToken: '',
        type: 'Login',
        platform: 'App',
        deviceOs: _deviceOs,
        deviceOsVersion: _deviceOsVersion,
        devicename: _deviceName,
      );

  Future<void> _getDeviceInfoFun() async {
    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo info = await deviceInfo.androidInfo;
      _deviceOs = 'Android';
      _deviceName = '${info.brand?.toUpperCase()}_${info.model?.toUpperCase()}';
      _deviceOsVersion = '${info.version.release}';
    }
  }

  /// Returns true if validated
  bool _checkValidationFun(context) {
    if (_tcToggle == false) {
      Utils.showPrimarySnackbar(context, LocalString.tcNotValidated);
      return false;
    } else if (_isOTPSent != false && _receivedOtp != _otpController.text) {
      Utils.showPrimarySnackbar(context, LocalString.otpNotValidated);
      return false;
    } else {
      return true;
    }
  }

  void onTcTappedFun() async {
    _tcToggle = !_tcToggle;
    notifyListeners();
  }

  void onNumberChangedFun(String value) {
    _isNumberValid = value.length == 10 ? true : false;

    if (_isNumberValid) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    notifyListeners();
  }

  void onOtpChangedFun(String value) {
    _isOtpValid = value.length == 4 ? true : false;

    if (_isOtpValid) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    notifyListeners();
  }
}
