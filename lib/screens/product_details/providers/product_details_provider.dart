import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/cart/data/cart_repository.dart';
import 'package:poc/screens/cart/data/models/cart_add_model.dart';
import 'package:poc/screens/main/main_screen.dart';
import 'package:poc/screens/product_details/data/models/product_details_model.dart';
import 'package:poc/screens/product_details/data/product_details_repository.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/enums.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final productDetailsProvider = ChangeNotifierProvider.autoDispose<ProductDetailsChangeProvider>(
  (ref) => ProductDetailsChangeProvider(),
);

class ProductDetailsChangeProvider extends BaseChangeNotifier {
  final ProductDetailsRepository _productDetailsRepo = ProductDetailsRepository();
  final CartRepository _cartRepo = CartRepository();

  String? _cityId;
  String? _userId;
  String? _productId;
  ProductDetailsData? _productDetailsData;
  bool _foldProductDes = false;
  String? _deliveryPlans;
  String? _deliverOnDate;
  String? _startDate;
  String? _endDate;
  int? _quantity;

  CustomDays _cDays = CustomDays(empty: 0, mon: 0, tue: 0, wed: 0, thur: 0, fri: 0, sat: 0, sun: 0);
  set cDays(CustomDays cD) => _cDays = cD;

  ProductDetailsData? get productDetailsData => _productDetailsData;
  bool get foldProductDes => _foldProductDes;

  List<String> get deliveryPlans => [
        'Daily',
        'Alternate',
        'Once',
        'Custom',
      ];

  List<String> get customDayList => [
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Satrurday',
      ];

  @override
  Future<void> postCreateState() async {
    _productId = data;

    await _gettingPrefs();
    await _productDetailsRequest();
  }

  void onReadMoreButton() {
    _foldProductDes = !_foldProductDes;
    notifyListeners();
  }

  Future<void> _productDetailsRequest() async {
    await _productDetailsRepo.productDetailsRepo(_productDetailsReqModel).then(
      (response) async {
        final result = ProductDetailsResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
          _productDetailsData = result.data;
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
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

  Future<void> _addToCartRequest() async {
    await _cartRepo.addToCartRepo(_addToCartReqModel).then(
      (response) async {
        final result = ProductDetailsResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          if (result.status == ResultStatus.success.index) {
            Utils.showPrimarySnackbar(context, result.message, type: SnackType.success);
            Utils.pushAndRemoveUntil(
              context,
              const MainScreen(navigate: NavigationMenu.cart),
            );
          } else {
            Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
          }
          _productDetailsData = result.data;
        } else {
          Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
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

  AddCartReqModel get _addToCartReqModel => AddCartReqModel(
        deliveryPlan: _deliveryPlans,
        quantity: _quantity.toString(),
        startDate: _startDate ?? _deliverOnDate,
        endDate: _endDate,
        productId: _productId,
        userID: _userId,
        cityId: _cityId,
        customDays: _cDays,
      );

  ProductDetailsReqModel get _productDetailsReqModel => ProductDetailsReqModel(
        cityId: int.parse(_cityId ?? ''),
        productId: int.parse(_productId ?? ''),
      );

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
    _cityId = await LocalStorage.getString(StorageField.cityId);
  }

  Future<void> onAddCartButton({
    required DeliveryPlan deliveryPlan,
    required int quantity,
    String? deliverOnDate,
    String? endDate,
    String? startDate,
  }) async {
    _deliveryPlans = deliveryPlan.name;
    _quantity = quantity;
    _deliverOnDate = deliverOnDate;
    _startDate = startDate;
    _endDate = endDate;

    switch (deliveryPlan) {
      case DeliveryPlan.once:
        debugPrint('aagasgasg: once');
        if (_deliverOnDate == null) {
          Utils.showPrimarySnackbar(context, 'Please select a delivery date', type: SnackType.invalidated);
          return;
        }
        break;
      default:
        if (startDate == null) {
          Utils.showPrimarySnackbar(context, 'Please select a start date', type: SnackType.invalidated);
          return;
        } else if (_endDate == null) {
          Utils.showPrimarySnackbar(context, 'Please select an end date', type: SnackType.invalidated);
          return;
        }
        break;
    }

    final minQuantity = _productDetailsData?.minimumQuantity ?? 0;

    if (quantity < minQuantity) {
      Utils.showPrimarySnackbar(context, 'Item Quantity should be minimum $minQuantity!', type: SnackType.invalidated);
      return;
    }

    showLoader(true);
    await _addToCartRequest();
    showLoader(false);
  }
}
