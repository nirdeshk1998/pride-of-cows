import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:poc/screens/address/data/address_book_repository.dart';
import 'package:poc/screens/address/data/models/addressbook_model.dart';
import 'package:poc/screens/cart/data/models/get_cart_model.dart';
import 'package:poc/screens/checkout/data/checkout_repo.dart';
import 'package:poc/screens/checkout/data/models/checkout_model.dart';
import 'package:poc/screens/checkout/data/switch_default_address_repo.dart';
import 'package:poc/screens/offers/data/models/offer_model.dart';
import 'package:poc/screens/offers/data/offer_repository.dart';
import 'package:poc/utils/base_provider.dart';
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
  final OfferRepository _offerRepository = OfferRepository();
  final SwitchDefaultAddressRepository _switchDefaultAddressRepository = SwitchDefaultAddressRepository();

  List<AddressBookData>? _addressBookData;

  List<AddressBookData>? get addressBookData => _addressBookData;

  bool showItems = false;
  String? _userId;
  String? _cityId;
  String? _pinCode;
  CheckoutData? _checkoutData;
  List<CartItemsData>? _cartList;
  PromocodeData? _promocodeData;
  String? _subTotal;
  String? totalPrice;
  int? totalItems;
  int selectedAddress = 0;
  int? totalAddress;
  int ? checkOutAddressId;
  int ? _addressCount;

  CheckoutData? get checkoutData => _checkoutData;

  int? get addressCount=>_addressCount;

  //  List<PromocodeData> ? get promocodeData =>_promocodeData;
  List<CartItemsData>? get cartItemData => _cartList;

  CheckoutData? get checkoutItems => _checkoutData;

  PromocodeData? get promocodeData => _promocodeData;

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
    await checkoutDetailRequest();
    await addressBookListRequest();
  }

  void getDefaultAddress(int checkoutAddress){
    checkOutAddressId=checkoutAddress;
    print(checkOutAddressId);
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

  Future<void> checkoutDetailRequest() async {
    await _checkoutRepo.getCheckOutList(_checkoutReqModel).then(
      (response) {
        final result = CheckoutResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.success);
          _checkoutData = result.checkOut;
          _cartList = result.cartItems;
          totalPrice = result.totalPrice;
          totalItems = result.totalItems;
          _promocodeData = result.promoCode;
 notifyListeners();
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

  Future<void> addressBookListRequest() async {
    await _addressBookRepo.addressBookListRepo(_userId).then(
      (response) async {
        final result = AddressBookResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          totalAddress = result.totaladdress;
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.debug);
          _addressBookData = result.data;
          _addressCount=result.totaladdress;
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(),
            type: SnackType.debug);
      },
    );
  }

  SwitchDefaultAddressReqModel get _switchDefaultAddressReqModel=>SwitchDefaultAddressReqModel(
    userId:  int.parse(_userId ?? ''),
    addressId: checkOutAddressId,
  );
  Future<void> switchDefaultAddress()async{
    await _switchDefaultAddressRepository.switchDefaultAddress(_switchDefaultAddressReqModel).then((response){
      final result=SwitchDefaultAddressResModel.fromJson(response.data);
      if (response.statusCode == 200) {
        addressBookListRequest();
        notifyListeners();
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

 void onAddressRadioButtonClicked(int checkOutAddress) async{
    checkOutAddressId=checkOutAddress;
    await switchDefaultAddress();
    notifyListeners();
  }

  RemoveOfferReqModel get _removeOfferReqModel {
    return RemoveOfferReqModel(
      userId: int.parse(_userId ?? ''),
    );
  }

  Future<void> removeOfferRequest() async {
    await _offerRepository.removeOffer(_removeOfferReqModel).then(
      (response) async {
        final result = RemoveOfferResModel.fromJson(response.data);
        print(response.data);
        if (response.statusCode == 200) {
          await checkoutDetailRequest();
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.success);
          notifyListeners();
        } else {
          Utils.showPrimarySnackbar(context, result.message,
              type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(context, error.type.toString(),
            type: SnackType.debug);
      },
    );
  }

}
