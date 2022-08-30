import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/city_model.dart';
import 'package:poc/network/models/pincode_model.dart';
import 'package:poc/network/models/state_model.dart';
import 'package:poc/network/repository.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final createUpdateAddressProvider = ChangeNotifierProvider.autoDispose<CreateUpdateAddressChangeProvider>(
  (ref) => CreateUpdateAddressChangeProvider(),
);

class CreateUpdateAddressChangeProvider extends BaseChangeNotifier {
  final ListDataRepository _listRepo = ListDataRepository();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _altNumberController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  String? _userId;
  String? _stateId;
  String? _cityId;
  List<StateListData>? _stateList;
  List<CityListData>? _cityList;
  int? _stateDropdownValue;
  String? _cityDropdownValue;

  TextEditingController get fullNameController => _firstNameController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get altNumberController => _altNumberController;
  TextEditingController get pincodeController => _pincodeController;
  TextEditingController get addressController => _addressController;
  TextEditingController get localityController => _localityController;
  TextEditingController get landmarkController => _landmarkController;
  TextEditingController get cityController => _cityController;
  List<StateListData> get stateList => _stateList ?? [];
  List<CityListData> get cityList => _cityList ?? [];
  int? get stateDropdownValue => _stateDropdownValue;
  String? get cityDropdownValue => _cityDropdownValue;

  bool home = true;
  bool work = false;
  bool others = false;
  bool defaultAddress = true;

  @override
  Future<void> postCreateState() async {
    await _stateListRequest();
  }

  void onPincodeChanged(String val) {
    if (val.length == 6) {
      _pincodeDataRequest(int.parse(val));
    }
  }

  Future<void> onStateChanged(stateId) async {
    _stateId = stateId.toString();
    showLoader(true);
    await _cityListRequest(stateId.toString());
    showLoader(false);
  }

  void onCityChanged(cityId) => _cityId = cityId;

  Future<void> _pincodeDataRequest(int pincode) async {
    showLoader(true);
    await _listRepo.pincodeDataRepo(pincode).then(
      (response) async {
        final result = PincodeResModel.fromJson(response.data);
        final element = result.data;

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);

          if (result.status != 0) {
            _stateDropdownValue = int.parse(element?.stateId ?? '0');
            await _cityListRequest(element?.stateId ?? '0');
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

  Future<void> _stateListRequest() async {
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

  Future<void> _cityListRequest(String stateId) async {
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

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }

  void onChangeHomeFun(bool? value) {
    home = true;
    work = false;
    others = false;
    notifyListeners();
  }

  void onChangeWorkFun(bool? value) {
    home = false;
    work = true;
    others = false;
    notifyListeners();
  }

  void onChangeOthersFun(bool? value) {
    home = false;
    work = false;
    others = true;
    notifyListeners();
  }

  void onChangeDefaultAddressFun(bool? value) {
    defaultAddress = !defaultAddress;
    notifyListeners();
  }
}
