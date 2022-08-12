import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/authentication/data/auth_repository.dart';
import 'package:poc/screens/authentication/data/models/login_model.dart';
import 'package:poc/screens/authentication/data/models/otp_model.dart';
import 'package:poc/screens/authentication/register_screen.dart';
import 'package:poc/screens/main/main_screen.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';

final loginProvider = ChangeNotifierProvider.autoDispose((ref) => LoginChangeProvider());

class LoginChangeProvider with ChangeNotifier {
  final AuthenticationRepository _authRepo = AuthenticationRepository();

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
    if (_tcToggle == false) {
      Utils.showPrimarySnackbar(context, LocalString.tcNotValidated, type: SnackType.invalidated);
      return;
    }

    showLoader(true);
    await _getDeviceInfoFun();
    await loginOtpRequest(context);
    _isOTPSent = true;
    showLoader(false);
  }

  void onVerifyButton(context) async {
    if (_tcToggle == false) {
      Utils.showPrimarySnackbar(context, LocalString.tcNotValidated, type: SnackType.invalidated);
      return;
    } else if (_receivedOtp != _otpController.text) {
      Utils.showPrimarySnackbar(context, LocalString.otpNotValidated, type: SnackType.invalidated);
      return;
    }

    showLoader(true);
    await otpVerificationRequest(context);
    showLoader(false);
    (_isNewUser == UserType.guest.index)
        ? await Utils.push(context, const RegisterScreen())
        : await Utils.pushAndRemoveUntil(context, const MainScreen());
  }

  void onResendSmsButton(context) async {
    if (_tcToggle == false) {
      Utils.showPrimarySnackbar(context, LocalString.tcNotValidated, type: SnackType.invalidated);
      return;
    }

    showLoader(true);
    await resendSmsOtpRequest(context);
    showLoader(false);
  }

  void onResendCallButton(context) async {
    if (_tcToggle == false) {
      Utils.showPrimarySnackbar(context, LocalString.tcNotValidated, type: SnackType.invalidated);
      return;
    }

    showLoader(true);
    await resendCallOtpRequest(context);
    showLoader(false);
  }

  Future<void> loginOtpRequest(context) async {
    await _authRepo.sendOtpRepo(_loginReqModel).then(
      (response) {
        final result = OtpResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          _receivedOtp = result.otp.toString();
          _isNewUser = result.isNew;
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, stackTrace.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> otpVerificationRequest(context) async {
    await _authRepo.verifyOtpRepo(_otpReqModel).then(
      (response) async {
        final result = LoginResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          final element = result.data;
          await _settingPrefs(element);
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, stackTrace.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> resendSmsOtpRequest(context) async {
    await _authRepo.resendSmsOtpRepo(_resendOtpReqModel).then(
      (response) {
        final result = OtpResModel.fromResendOtpJson(response.data);
        if (response.statusCode == 200) {
          _receivedOtp = result.otp.toString();
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, stackTrace.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> resendCallOtpRequest(context) async {
    await _authRepo.resendCallOtpRepo(_resendOtpReqModel).then(
      (response) {
        final result = OtpResModel.fromResendOtpJson(response.data);

        if (response.statusCode == 200) {
          _receivedOtp = result.otp.toString();
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, stackTrace.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> _settingPrefs(Data? element) async {
    await LocalStorage.setString(element?.token, StorageField.token);
    await LocalStorage.setString(element?.userID.toString(), StorageField.userId);
    await LocalStorage.setString(element?.mobileNo, StorageField.mobileNumber);
    await LocalStorage.setString(element?.firstName, StorageField.firstName);
    await LocalStorage.setString(element?.lastName, StorageField.lastName);
    await LocalStorage.setString(element?.middleName, StorageField.middleName);
    await LocalStorage.setString(element?.addressType, StorageField.addressType);
    await LocalStorage.setString(element?.area, StorageField.area);
    await LocalStorage.setString(element?.buildingName, StorageField.buildingName);
    await LocalStorage.setString(element?.city, StorageField.city);
    await LocalStorage.setString(element?.cityId, StorageField.cityId);
    await LocalStorage.setString(element?.customerType, StorageField.customerType);
    await LocalStorage.setString(element?.deliveryOption, StorageField.deliveryOption);
    await LocalStorage.setString(element?.email, StorageField.email);
    await LocalStorage.setString(element?.flatPlotNo, StorageField.flatPlotNumber);
    await LocalStorage.setString(element?.landmark, StorageField.landmark);
    await LocalStorage.setString(element?.streetRoad, StorageField.streetRoad);
    await LocalStorage.setString(element?.pincode.toString(), StorageField.pincode);
  }

  OtpReqModel get _otpReqModel => OtpReqModel(
        mobileNo: _numberController.text,
        otp: _otpController.text,
      );

  OtpReqModel get _resendOtpReqModel => OtpReqModel(
        mobileNo: _numberController.text,
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

  void onTcTappedFun() {
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
