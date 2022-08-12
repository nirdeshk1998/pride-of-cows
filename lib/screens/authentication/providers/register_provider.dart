import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/network/repository.dart';
import 'package:poc/screens/authentication/data/auth_repository.dart';
import 'package:poc/screens/authentication/data/models/login_model.dart';
import 'package:poc/screens/authentication/data/models/otp_model.dart';
import 'package:poc/screens/authentication/data/models/user_register_model.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final registerProvider = ChangeNotifierProvider.autoDispose((ref) => RegisterChangeProvider());

class RegisterChangeProvider with ChangeNotifier {
  final AuthenticationRepository _authRepo = AuthenticationRepository();
  final ListDataRepository _listRepo = ListDataRepository();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _referralController = TextEditingController();
  final TextEditingController _addressLineController = TextEditingController();
  final TextEditingController _addressLine2Controller = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();

  bool _tcToggle = false;
  bool _isLoading = false;
  String? _userId;
  String? _gender;
  int? _state;
  int? _city;
  List? _stateList;
  List? _cityList;

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get referralController => _referralController;
  TextEditingController get addressLineController => _addressLineController;
  TextEditingController get addressLine2Controller => _addressLine2Controller;
  TextEditingController get pincodeController => _pincodeController;
  bool get isLoading => _isLoading;
  bool get tcToggle => _tcToggle;

  List get stateList => _stateList ?? [];
  List get cityList => _cityList ?? [];

  void showLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void onGenderChanged(gender) => _gender = gender;
  void onStateChanged(state) => _state = state;
  void onCityChanged(city) => _city = city;

  Future<void> onStartShoppingButton(context) async {
    if (true) return;
    showLoader(true);
    await _getUserData();
    await _userRegisterRequest(context);
    showLoader(false);
  }

  void onTcPressedFun() {
    _tcToggle = !tcToggle;
    notifyListeners();
  }

  Future<void> _stateListRequest(context) async {
    await _listRepo.stateListRepo().then(
      (response) {
        final result = LoginResModel.fromJson(response.data);

        if (response.statusCode == 200) {
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

  Future<void> _cityListRequest(context) async {
    await _listRepo.cityListRepo('').then(
      (response) {
        final result = LoginResModel.fromJson(response.data);

        if (response.statusCode == 200) {
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

  Future<void> _userRegisterRequest(context) async {
    await _authRepo.userRegistrationRepo(_registerReqModel).then(
      (response) {
        final result = LoginResModel.fromJson(response.data);

        if (response.statusCode == 200) {
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

  UserRegisterReqModel get _registerReqModel => UserRegisterReqModel(
        userId: _userId,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        gender: _gender,
        referedCode: _referralController.text,
        address1: _addressLineController.text,
        address2: _addressLine2Controller.text,
        pincode: int.parse(_pincodeController.text),
        state: _state,
        city: _city,
      );

  Future<void> _getUserData() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
