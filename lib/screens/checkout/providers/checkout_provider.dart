import 'package:dio/dio.dart';
import 'package:poc/screens/address/data/address_book_repository.dart';
import 'package:poc/screens/address/data/models/addressbook_model.dart';
import 'package:poc/screens/cart/data/models/get_cart_model.dart';
import 'package:poc/screens/checkout/data/checkout_repo.dart';
import 'package:poc/screens/checkout/data/models/checkout_model.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

final checkoutProvider =
    ChangeNotifierProvider.autoDispose<CheckoutChangeProvider>(
  (ref) => CheckoutChangeProvider(),
);

class CheckoutChangeProvider extends BaseChangeNotifier {
  final CheckoutRepository _checkoutRepo = CheckoutRepository();
  final AddressBookRepository _addressBookRepo = AddressBookRepository();
  List<AddressBookData>? _addressBookData;

  List<AddressBookData>? get addressBookData => _addressBookData;

  bool showItems = false;
  String? _userId;
  String? _cityId;
  String? _pinCode;
  CheckoutData? _checkoutData;
  List<CartItemsData>? _cartList;
  List<PromocodeData>? _promocodeData;
  String? _subTotal;
  String ? totalPrice;
  int ?totalItems;
  int selectedAddress=0;

  CheckoutData? get checkoutData => _checkoutData;

  //  List<PromocodeData> ? get promocodeData =>_promocodeData;
  List<CartItemsData>? get cartItemData => _cartList;
  CheckoutData? get checkoutItems=>_checkoutData;

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
    await _checkoutDetailRequest();
    await _addressBookListRequest();
  }

  void showAndHideItems() {
    showItems = !showItems;
    notifyListeners();
  }

  CheckoutReqModel get _checkoutReqModel => CheckoutReqModel(
        userId: int.parse(_userId ?? ''),
        cityId: int.parse(_cityId ?? ''),
        pincode: _pinCode,
      );

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
    _cityId = await LocalStorage.getString(StorageField.cityId);
    _pinCode = await LocalStorage.getString(StorageField.pincode);
  }

  Future<void> _checkoutDetailRequest() async {
    await _checkoutRepo.getCheckOutList(_checkoutReqModel).then(
      (response) {
        final result = CheckoutResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.debug);
          _checkoutData = result.checkOut;
          _cartList = result.cartItems;
          totalPrice=result.totalPrice;
          totalItems=result.totalItems;
          // _promocodeData = result.promoCode;

        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(context, error.type, type: SnackType.debug);
      },
    ).catchError((Object e) {
      showLoader(false);
      Utils.showPrimarySnackbar(context, e, type: SnackType.debugError);
    });
  }

  Future<void> _addressBookListRequest() async {
    await _addressBookRepo.addressBookListRepo(_userId).then(
          (response) async {
        final result = AddressBookResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
          _addressBookData = result.data;
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
  void onAddressRadioButtonClicked(int index){
    selectedAddress=index;
    notifyListeners();
  }
}
