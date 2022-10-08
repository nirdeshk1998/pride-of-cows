import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:poc/screens/profile/data/models/profile_model.dart';
import 'package:poc/screens/profile/data/profile_repository.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final profileProvider =
    ChangeNotifierProvider.autoDispose((ref) => ProfileChangeProvider());

class ProfileChangeProvider with ChangeNotifier {
  final ProfileUpdateRepository _profileRepo = ProfileUpdateRepository();

  bool saveButtonState = false;
  bool isFnameEntered = false;
  bool isLNameEntered = false;
  bool isPhNoEntered = false;
  bool isGenderEntered = false;
  bool isEmailIdEntered = false;
  bool isDobEntered = false;
  bool isSubScribeChecked = false;
  bool _isLoading = false;
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _phoneNoController = TextEditingController();
  final TextEditingController _eMailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  String? fName;
  String? lName;
  String? phNo;
  String? gender;
  String? emailId;
  String? dob;
  String? userId;
  var pickedDate;
  String? selectedGender;
  String subScribeNewLetter = "no";

  TextEditingController get numberController => _numberController;

  TextEditingController get fNameController => _fNameController;

  TextEditingController get lNameController => _lNameController;

  TextEditingController get phoneNoController => _phoneNoController;

  TextEditingController get eMailController => _eMailController;

  TextEditingController get dobController => _dobController;

  bool get isLoading => _isLoading;

  Future<void> initState(BuildContext context) async {
    await _gettingPrefs(context);
    await _getMyProfileInfo(context);
  }

  void showLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void onChangeFNameFun(String value) {
    if (value.isEmpty || value == fName) {
      isFnameEntered = false;
    } else {
      isFnameEntered = true;
      // onAllChangeFun();
    }
    onAllChangeFun();
    notifyListeners();
  }

  void onChangeLNameFun(String value) {
    if (value.isEmpty || value == lName) {
      isLNameEntered = false;
    } else {
      isLNameEntered = true;
    }
    onAllChangeFun();
    notifyListeners();
  }

  void onChangePhNoFun(String value) {
    if (value.length < 10 || value == phNo) {
      isPhNoEntered = false;
    } else {
      isPhNoEntered = true;
    }
    onAllChangeFun();
    notifyListeners();
  }

  void onChangeGenderFun(value) {
    if (value == null || value == gender) {
      isGenderEntered = false;
    } else {
      isGenderEntered = true;
    }
    gender = value;
    onAllChangeFun();
    notifyListeners();
  }

  void onChangeEmailFun(String value) {
    if (value.isEmpty || value == emailId) {
      isEmailIdEntered = false;
    } else {
      isEmailIdEntered = true;
    }
    onAllChangeFun();
    notifyListeners();
  }

  void onDateSelected(DateTime date) async {
    _dobController.text = DateFormat("dd/MM/yyy").format(date);
    isDobEntered = true;
    onAllChangeFun();
    notifyListeners();
  }

  // void onChangeDobFun(String value) {
  //   if (value.length == 0 || value == dob) {
  //     isDobEntered = false;
  //   } else {
  //     isDobEntered = true;
  //   }
  //   print("hello");
  //   onAllChangeFun();
  //   notifyListeners();
  // }

  void onAllChangeFun() {
    if (isFnameEntered ||
        isLNameEntered ||
        isPhNoEntered ||
        isGenderEntered ||
        isEmailIdEntered ||
        isDobEntered) {
      saveButtonState = true;
    } else {
      saveButtonState = false;
    }
  }

  void onSubScribeChecked(bool? value) {
    if (value == true) {
      subScribeNewLetter = "yes";
    } else {
      subScribeNewLetter = "no";
    }
  }

  Future<void> _gettingPrefs(context) async {
    userId = await LocalStorage.getString(StorageField.userId);
    fName = await LocalStorage.getString(StorageField.firstName);
    lName = await LocalStorage.getString(StorageField.lastName);
    phNo = await LocalStorage.getString(StorageField.mobileNumber);
    gender = await LocalStorage.getString(StorageField.gender);
    print("*********");
    print(gender);
    print("*********");
    emailId = await LocalStorage.getString(StorageField.email);
    dob=await LocalStorage.getString(StorageField.dob);
    notifyListeners();
  }

  Future<void> _getMyProfileInfo(context) async {
    _fNameController.text = fName.toString();
    _lNameController.text = lName.toString();
    _phoneNoController.text = phNo.toString();
    _eMailController.text = emailId.toString();
    if(gender!=""){
      String caps(String s)=>s[0].toUpperCase()+s.substring(1);
      gender=caps(gender.toString());
      print("*********");
      print(gender);
      print("*********");
    }
    else{
      gender="Male";
    }
    if(dob!=null){
      _dobController.text=dob.toString();
    }
    notifyListeners();

  }

  ProfileUpdateReqModel get _profileUpdateList => ProfileUpdateReqModel(
        userId: int.parse(userId.toString()),
        firstName: _fNameController.text,
        lastName: _lNameController.text,
        mobileNo: _phoneNoController.text,
        email: _eMailController.text,
        gender: gender,
        dob: _dobController.text,
        subsScribeNewsLetter: subScribeNewLetter,
      );

  Future<void> onEditButtonPressed(context) async {
    if (_fNameController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'First name is required',
          type: SnackType.invalidated);
      return;
    } else if (_lNameController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'Last name is required',
          type: SnackType.invalidated);
      return;
    } else if (_eMailController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'Email id is required',
          type: SnackType.invalidated);
      return;
    } else if (gender == null) {
      Utils.showPrimarySnackbar(context, 'Gender is required',
          type: SnackType.invalidated);
      return;
    } else if (_phoneNoController.text.isEmpty) {
      Utils.showPrimarySnackbar(context, 'Phone Number is required',
          type: SnackType.invalidated);
      return;
    } else if (_phoneNoController.text.length < 10) {
      Utils.showPrimarySnackbar(context, 'Invalid Phone Number',
          type: SnackType.invalidated);
      return;
    } else if (_phoneNoController.text.length < 10) {
      Utils.showPrimarySnackbar(context, 'Invalid Phone Number',
          type: SnackType.invalidated);
      return;
    } else if (_eMailController.text.isNotEmpty) {
      bool emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(_eMailController.text);
      print(emailValid);
      if (!emailValid) {
        Utils.showPrimarySnackbar(context, 'Invalid Email',
            type: SnackType.invalidated);
        return;
      } else {}
    }

    showLoader(true);
    await _updateProfileRequest(context);
    showLoader(false);
  }

  Future<void> _updateProfileRequest(context) async {
    await _profileRepo.sendNewProfileDetails(_profileUpdateList)
        .then((response) {
      final result = ProfileUpdateResModel.fromJson(response.data);
      print(response.data);
      if (response.statusCode == 200) {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.success);
        _settingPrefs(context);
      } else {
        Utils.showPrimarySnackbar(context, result.message,
            type: SnackType.error);
      }
    }).onError((error, stackTrace) {
      Utils.showPrimarySnackbar(context, error.toString(),
          type: SnackType.debug);
    });
  }

  Future<void> _settingPrefs(context) async {
    await LocalStorage.setString(
        _phoneNoController.text, StorageField.mobileNumber);
    await LocalStorage.setString(_fNameController.text, StorageField.firstName);
    await LocalStorage.setString(_lNameController.text, StorageField.lastName);
    await LocalStorage.setString(gender, StorageField.gender);
    await LocalStorage.setString(_eMailController.text, StorageField.email);
    await LocalStorage.setString(_dobController.text, StorageField.dob);
  }
}
