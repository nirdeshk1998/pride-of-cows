import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/product_details/data/models/product_details_model.dart';
import 'package:poc/screens/product_details/data/product_details_repository.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final productDetailsProvider = ChangeNotifierProvider.autoDispose<ProductDetailsChangeProvider>(
  (ref) => ProductDetailsChangeProvider(),
);

class ProductDetailsChangeProvider extends ChangeNotifier {
  final ProductDetailsRepository _productDetailsRepo = ProductDetailsRepository();
  late BuildContext _context;

  String? _cityId;
  String? _productId;
  ProductDetailsData? _productDetailsData;
  bool _minimizeAboutProduct = false;

  ProductDetailsData? get productDetailsData => _productDetailsData;
  bool get minimizeAboutProduct => _minimizeAboutProduct;

  List<String> get imageList => [
        'https://i.pinimg.com/564x/41/54/46/415446f55e53b7d3ba09d3c3dc848d59.jpg',
        'https://i.pinimg.com/564x/03/8e/3f/038e3f67c94e85238182b45f5f1345f1.jpg',
        'https://i.pinimg.com/564x/92/5c/0b/925c0b7635ed386fe940736d3726297d.jpg',
      ];

  List<String> get deliveryPlans => [
        'daily',
        'alternate',
        'once',
        'custom',
      ];

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void showLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> initState(BuildContext context, String? productId) async {
    _context = context;
    _productId = productId;

    showLoader(true);

    await _gettingPrefs();
    await _productDetailsRequest();

    showLoader(false);
  }

  void onReadMoreButton() {
    _minimizeAboutProduct = !_minimizeAboutProduct;
    notifyListeners();
  }

  Future<void> _productDetailsRequest() async {
    await _productDetailsRepo.productDetailsRepo(_productDetailsReqModel).then(
      (response) async {
        final result = ProductDetailsResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          Utils.showPrimarySnackbar(_context, result.message, type: SnackType.debug);
          _productDetailsData = result.data;
        } else {
          Utils.showPrimarySnackbar(_context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (DioError error, stackTrace) {
        debugPrint('error: ${error.type}');
        showLoader(false);

        Utils.showPrimarySnackbar(_context, error.type.toString(), type: SnackType.debug);
      },
    );
  }

  ProductDetailsReqModel get _productDetailsReqModel => ProductDetailsReqModel(
        cityId: int.parse(_cityId ?? ''),
        productId: int.parse(_productId ?? ''),
      );

  Future<void> _gettingPrefs() async {
    _cityId = await LocalStorage.getString(StorageField.cityId);
  }
}
