import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/cart/cart_summary.dart';
import 'package:poc/screens/cart/data/cart_repository.dart';
import 'package:poc/screens/cart/data/models/get_cart_model.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final cartProvider = ChangeNotifierProvider.autoDispose<CartChangeProvider>(
  (ref) => CartChangeProvider(),
);

class CartChangeProvider extends BaseChangeNotifier {
  final CartRepository _cartRepo = CartRepository();

  String? _userId;
  String? _cityId;
  String? _pincode;
  List<CartItemsData>? _cartList;
  int? _totalPrice;
  int? _totalItems;

  List<CartItemsData>? get cartList => _cartList;
  int? get totalPrice => _totalPrice;
  int? get totalItems => _totalItems;

  String appliedOffer = "";
  bool showItems = false;

  // bool _isLoading = true;
  // bool get isLoading => _isLoading;
  // void showLoader(bool value) {
  //   _isLoading = value;
  //   notifyListeners();
  // }

  @override
  Future<void> postCreate() async {
    await _gettingPrefs();
    await _userCartRequest();
  }

  // Future<void> onCreate(BuildContext context) async {
  //   _context = context;
  //   if (_isCreated) return;
  //   _isCreated = true;

  //   showLoader(true);

  //   await _gettingPrefs();
  //   await _userCartRequest();

  //   showLoader(false);
  // }

  Future<void> _userCartRequest() async {
    await _cartRepo.userCartRepo(_userCartReqModel).then(
      (response) async {
        final result = UserCartResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);

          _cartList = result.cartItems;
          _totalPrice = result.totalPrice;
          _totalItems = result.totalItems;
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

  UserCartReqModel get _userCartReqModel => UserCartReqModel(
        userId: _userId,
        cityId: _cityId,
        pincode: _pincode,
      );

  Future<void> _gettingPrefs() async {
    _cityId = await LocalStorage.getString(StorageField.cityId);
    _userId = await LocalStorage.getString(StorageField.userId);
    _pincode = await LocalStorage.getString(StorageField.pincode);
  }

  void onApplyOffer(String value, context) {
    appliedOffer = value;
    Utils.push(context, const CartSummary());
    notifyListeners();
  }

  void onRemoveOffer() {
    appliedOffer = "";
    notifyListeners();
  }

  void showAndHideItems() {
    showItems = !showItems;
    notifyListeners();
  }
}
