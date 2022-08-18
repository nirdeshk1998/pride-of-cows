import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/home/data/home_repo.dart';
import 'package:poc/screens/home/data/models/category_model.dart';
import 'package:poc/screens/home/data/models/product_model.dart';
import 'package:poc/screens/products/data/models/products_model.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final homeProvider = ChangeNotifierProvider.autoDispose((ref) => HomeChangeProvider());

class HomeChangeProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  late BuildContext _context;

  bool _isLoading = false;
  int? _userId, _cityId;
  List<CategoryData>? _categoryList;
  List<ProductData>? _productList;

  List<CategoryData>? get categoryList => _categoryList;
  List<ProductData>? get productList => _productList;
  DateTime get currentDate => DateTime.now();
  List<String> get weekNameList => ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  List<String> get imageList => [
        'https://i.pinimg.com/564x/41/54/46/415446f55e53b7d3ba09d3c3dc848d59.jpg',
        'https://i.pinimg.com/564x/03/8e/3f/038e3f67c94e85238182b45f5f1345f1.jpg',
        'https://i.pinimg.com/564x/92/5c/0b/925c0b7635ed386fe940736d3726297d.jpg',
      ];

  List<String> getCurrentWeek() {
    final DateTime startFrom = currentDate.subtract(Duration(days: currentDate.weekday));
    return List.generate(7, (i) => '${startFrom.add(Duration(days: i)).day}');
  }

  void showLoader(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> initState(BuildContext context) async {
    _context = context;

    showLoader(true);

    await _gettingPrefs();
    await _categoryListRequest();
    await _productListRequest();

    showLoader(false);
  }

  Future<void> _categoryListRequest() async {
    await _homeRepo.categoryListRepo().then(
      (response) async {
        final result = CategoryListResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          _categoryList = result.data ?? [];

          Utils.showPrimarySnackbar(_context, result.message, type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(_context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(_context, error.toString(), type: SnackType.debug);
      },
    );
  }

  Future<void> _productListRequest() async {
    await _homeRepo.productListRepo(_productReqModel).then(
      (response) async {
        final result = ProductListResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          _productList = result.data;
          Utils.showPrimarySnackbar(_context, result.message, type: SnackType.success);
        } else {
          Utils.showPrimarySnackbar(_context, result.message, type: SnackType.error);
        }
      },
    ).onError(
      (error, stackTrace) {
        showLoader(false);
        Utils.showPrimarySnackbar(_context, error.toString(), type: SnackType.debug);
      },
    );
  }

  ProductReqModel get _productReqModel => ProductReqModel(
        userId: _userId,
        catId: null,
        cityId: _cityId,
        page: 1,
        perPage: 6,
        search: '',
      );

  Future<void> _gettingPrefs() async {
    _userId = int.parse(await LocalStorage.getString(StorageField.userId) ?? '');
    _cityId = int.parse(await LocalStorage.getString(StorageField.cityId) ?? '');
  }
}
