import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/models/city_model.dart';
import 'package:poc/network/models/common_model.dart';
import 'package:poc/network/models/pincode_model.dart';
import 'package:poc/network/models/state_model.dart';
import 'package:poc/network/repository.dart';
import 'package:poc/screens/address/data/address_book_repository.dart';
import 'package:poc/screens/address/data/models/addressbook_model.dart';
import 'package:poc/screens/address/data/models/save_address_model.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/dimensions.dart';
import 'package:poc/utils/extensions.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/strings.dart';
import 'package:poc/utils/utils.dart';
import 'package:poc/widgets/buttons.dart';
import 'package:poc/widgets/text_view.dart';

enum AddressGroupValue {
  home,
  work,
  other,
}

final createUpdateAddressProvider = ChangeNotifierProvider.autoDispose<CreateUpdateAddressChangeProvider>(
  (ref) => CreateUpdateAddressChangeProvider(),
);

class CreateUpdateAddressChangeProvider extends BaseChangeNotifier {
  final AddressBookRepository _addressBookRepo = AddressBookRepository();
  final ListDataRepository _listRepo = ListDataRepository();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _altNumberController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _otherAddressController = TextEditingController();

  String? _userId;
  String? _stateId;
  String? _cityId;
  List<StateListData>? _stateList;
  List<CityListData>? _cityList;
  int? _stateDropdownValue;
  String? _cityDropdownValue;
  bool _isDefaultAddress = true;
  AddressGroupValue _addressGroupValue = AddressGroupValue.home;
  String? _addressId;

  TextEditingController get fullNameController => _fullNameController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get altNumberController => _altNumberController;
  TextEditingController get pincodeController => _pincodeController;
  TextEditingController get addressController => _addressController;
  TextEditingController get localityController => _localityController;
  TextEditingController get landmarkController => _landmarkController;
  TextEditingController get cityController => _cityController;
  TextEditingController get otherAddressController => _otherAddressController;
  List<StateListData> get stateList => _stateList ?? [];
  List<CityListData> get cityList => _cityList ?? [];
  int? get stateDropdownValue => _stateDropdownValue;
  String? get cityDropdownValue => _cityDropdownValue;
  AddressGroupValue get groupValue => _addressGroupValue;
  bool get isDefaultAddress => _isDefaultAddress;

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();

    if (data == null) {
      await _stateListRequest();
    } else {
      await onEditAddress(data);
    }
  }

  Future<void> onPincodeChanged(String val) async {
    if (val.length == 6) {
      showLoader(true);
      await _pincodeDataRequest(int.parse(val));

      if (_stateId == null)return showLoader(false);
      _stateDropdownValue = int.parse(_stateId ?? '0');

      await _cityListRequest(_stateId ?? '0');

      if (_cityId == null) return showLoader(false);
      debugPrint('_cityId: $_cityId');
      _cityDropdownValue = _cityId ?? '0';

      showLoader(false);
    }
  }

  Future<void> onStateChanged(stateId) async {
    showLoader(true);
    _stateId = stateId.toString();
    await _cityListRequest(stateId.toString());
    showLoader(false);
  }

  void onCityChanged(cityId) => _cityId = cityId;

  Future<void> _saveAddressRequest() async {
    await _addressBookRepo.saveAddressRepo(_createUpdateAddressReqModel).then(
      (response) async {
        final result = CommonResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
          Utils.pop(context, true);
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

  Future<void> _updateAddressRequest() async {
    await _addressBookRepo.updateAddressRepo(_createUpdateAddressReqModel).then(
      (response) async {
        final result = CommonResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
          _onSuccess();
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

  Future<void> _pincodeDataRequest(int pincode) async {
    await _listRepo.pincodeDataRepo(pincode).then(
      (response) async {
        final result = PincodeResModel.fromJson(response.data);
        final element = result.data;

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);

          if (result.status != 0) {
            // _stateDropdownValue = int.parse(element?.stateId ?? '0');
            // await _cityListRequest(element?.stateId ?? '0');
            // _cityDropdownValue = element?.cityId ?? '0';
            _stateId = element?.stateId;
            _cityId = element?.cityId;
          }
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

  CreateUpdateAddressReqModel get _createUpdateAddressReqModel => CreateUpdateAddressReqModel(
        addressId: _addressId,
        name: _fullNameController.text,
        mobileNo: int.parse(_phoneNumberController.text),
        alternativeNo: int.parse(_altNumberController.text),
        address: _addressController.text,
        locality: _localityController.text,
        landmark: _landmarkController.text,
        pincode: int.parse(_pincodeController.text),
        state: int.parse(_stateId ?? ''),
        city: int.parse(_cityId ?? ''),
        defaultAddress: _isDefaultAddress ? 'yes' : 'no',
        othername: _otherAddressController.text,
        addressType: _addressGroupValue.name.capitalize,
      );

  void _onSuccess() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext ctx) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Dialog(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimensions.defaultPadding,
                  vertical: 30.0,
                ),
                children: [
                  Center(
                    child: TextView(
                      LocalString.addressUpdateReqTitle,
                      height: 1,
                      maxLines: 3,
                      textType: TextType.header2,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Divider(
                    height: 21,
                  ),
                  TextView(
                    LocalString.addressUpdateReqSubtitle,
                    maxLines: 10,
                    textType: TextType.subtitle,
                    height: 1.5,
                  ),
                  30.0.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PrimaryButton(
                        title: "okay, i understand",
                        isFilled: true,
                        onPressed: () {
                          Utils.pop(ctx);
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }).whenComplete(() => Utils.pop(context, true));
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }

  void onGroupValueChanged(AddressGroupValue? value) {
    _addressGroupValue = value ?? AddressGroupValue.home;
    notifyListeners();
  }

  void onDefaultAddressChanged(bool? value) {
    _isDefaultAddress = value ?? false;
    notifyListeners();
  }

  Future<void> onSaveButton() async {
    showLoader(true);
    _addressId != null ? await _updateAddressRequest() : await _saveAddressRequest();
    showLoader(false);
  }

  Future<void> onEditAddress(AddressBookData? addressData) async {
    debugPrint('addressData: ${addressData?.toJson()}');
    _addressId = addressData?.id ?? '';
    _fullNameController.text = addressData?.name ?? '';
    _phoneNumberController.text = addressData?.mobileNo ?? '';
    _altNumberController.text = addressData?.alternativeNo ?? '';
    _addressController.text = addressData?.address ?? '';
    _localityController.text = addressData?.locality ?? '';
    _landmarkController.text = addressData?.landmark ?? '';
    _pincodeController.text = addressData?.pincode ?? '';
    _stateId = addressData?.state ?? '';
    _cityId = addressData?.city ?? '';
    _isDefaultAddress = (addressData?.defaultAddress ?? '').contains('yes') ? true : false;
    _otherAddressController.text = addressData?.othername ?? '';

    debugPrint('addressData?.addressType?.toLowerCase(): ${addressData?.selectType?.toLowerCase()}');

    switch (addressData?.selectType?.toLowerCase()) {
      case 'home':
        _addressGroupValue = AddressGroupValue.home;
        break;
      case 'work':
        _addressGroupValue = AddressGroupValue.work;
        break;
      case 'other':
        _addressGroupValue = AddressGroupValue.other;
        break;
      // default:
      //   _addressGroupValue = AddressGroupValue.other;
      //   _otherAddressController.text = addressData?.addressType ?? '';
      //   break;
    }

    await _stateListRequest();
    _stateDropdownValue = int.parse(_stateId ?? '0');
    await _cityListRequest(_stateId ?? '0');
    _cityDropdownValue = _cityId ?? '0';
  }
}
