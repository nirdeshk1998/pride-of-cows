import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/city_model.dart';
import 'package:poc/network/models/pincode_model.dart';
import 'package:poc/network/models/state_model.dart';
import 'package:poc/network/repository.dart';
import 'package:poc/screens/authentication/data/auth_repository.dart';
import 'package:poc/screens/authentication/data/models/login_model.dart';
import 'package:poc/screens/authentication/data/models/user_register_model.dart';
import 'package:poc/screens/main/main_screen.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/strings.dart';
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
  final TextEditingController _landmarkController = TextEditingController();

  bool _tcToggle = false;
  bool _isLoading = false;
  String? _userId;
  String? _gender;
  String? _stateId;
  String? _cityId;
  List<StateListData>? _stateList;
  List<CityListData>? _cityList;
  int? _stateDropdownValue;
  String? _cityDropdownValue;

  TextEditingController get firstNameController => _firstNameController;
  TextEditingController get lastNameController => _lastNameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get referralController => _referralController;
  TextEditingController get addressLineController => _addressLineController;
  TextEditingController get addressLine2Controller => _addressLine2Controller;
  TextEditingController get pincodeController => _pincodeController;
  TextEditingController get landmarkController => _landmarkController;
  bool get isLoading => _isLoading;
  bool get tcToggle => _tcToggle;
  List<StateListData> get stateList => _stateList ?? [];
  List<CityListData> get cityList => _cityList ?? [];
  int? get stateDropdownValue => _stateDropdownValue;
  String? get cityDropdownValue => _cityDropdownValue;

  void showLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> onCreate(context) async {
    showLoader(true);
    await _stateListRequest(context);
    showLoader(false);
  }

  void onGenderChanged(gender) => _gender = gender;
  void onCityChanged(cityId) => _cityId = cityId;

  Future<void> onStateChanged(stateId, context) async {
    _stateId = stateId.toString();
    showLoader(true);
    await _cityListRequest(context, stateId.toString());
    showLoader(false);
  }

  Future<void> onStartShoppingButton(context) async {
    if (_firstNameController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'First name is required', type: SnackType.invalidated);
      return;
    } else if (_lastNameController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'Last name is required', type: SnackType.invalidated);
      return;
    } else if (_emailController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'Email id is required', type: SnackType.invalidated);
      return;
    } else if (_gender == null) {
      Utils.showPrimarySnackbar(context, 'Gender is required', type: SnackType.invalidated);
      return;
    } else if (_addressLineController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'Address is required', type: SnackType.invalidated);
      return;
    } else if (_landmarkController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'Landmark is required', type: SnackType.invalidated);
      return;
    } else if (_pincodeController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'Pincode is required', type: SnackType.invalidated);
      return;
    } else if ((_stateId ?? '').isEmpty) {
      Utils.showPrimarySnackbar(context, 'State is required', type: SnackType.invalidated);
      return;
    } else if ((_cityId ?? '').isEmpty) {
      Utils.showPrimarySnackbar(context, 'City is required', type: SnackType.invalidated);
      return;
    } else if (!_tcToggle) {
      Utils.showPrimarySnackbar(context, LocalString.tcNotValidated, type: SnackType.invalidated);
      return;
    }

    showLoader(true);
    await _gettingPrefs();
    await _userRegisterRequest(context);
    showLoader(false);
  }

  void onPincodeChanged(String val, BuildContext context) {
    if (val.length == 6) {
      _pincodeDataRequest(context, int.parse(val));
    }
  }

  void onTcPressedFun() {
    _tcToggle = !tcToggle;
    notifyListeners();
  }

  Future<void> _stateListRequest(context) async {
    await _listRepo.stateListRepo().then(
      (response) {
        final result = StateListResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          _stateList = result.data;
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> _pincodeDataRequest(context, int pincode) async {
    showLoader(true);
    await _listRepo.pincodeDataRepo(pincode).then(
      (response) async {
        final result = PincodeResModel.fromJson(response.data);
        final element = result.data;

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);

          if (result.status != 0) {
            _stateDropdownValue = int.parse(element?.stateId ?? '0');
            await _cityListRequest(context, element?.stateId ?? '0');
            _cityDropdownValue = element?.cityId ?? '0';
            _stateId = element?.stateId;
            _cityId = element?.cityId;
          }
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
        showLoader(false);
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> _cityListRequest(BuildContext context, String stateId) async {
    await _listRepo.cityListRepo(stateId).then(
      (response) {
        final result = CityListResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
          _cityList = result.data;
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> _userRegisterRequest(context) async {
    await _authRepo.userRegistrationRepo(_registerReqModel).then(
      (response) async {
        final result = LoginResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
          await _settingPrefs(result.data);
          Utils.pushAndRemoveUntil(context, const MainScreen());
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(), type: SnackType.debug);
      },
    );
  }

  UserRegisterReqModel get _registerReqModel => UserRegisterReqModel(
        userId: _userId,
        firstName: _firstNameController.text,
        lastName: _lastNameController.text,
        email: _emailController.text,
        gender: _gender?.toLowerCase(),
        referedCode: _referralController.text,
        address1: _addressLineController.text,
        address2: _addressLine2Controller.text,
        landmark: _landmarkController.text,
        pincode: _pincodeController.text,
        state: _stateId,
        city: _cityId,
      );

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }

  Future<void> _settingPrefs(LoginData? element) async {
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
}
