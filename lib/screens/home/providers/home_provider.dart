import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:poc/screens/home/data/home_repo.dart';
import 'package:poc/screens/home/data/models/category_model.dart';
import 'package:poc/screens/home/data/models/home_model.dart';
import 'package:poc/screens/products/data/models/products_model.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final homeProvider = ChangeNotifierProvider.autoDispose((ref) => HomeChangeProvider());

class HomeChangeProvider with ChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  late BuildContext _context;

  bool _isLoading = true;
  String? _userId;
  List<CategoryData>? _categoryList;
  List<ProductData>? _topPicksList;
  List<DealsOfferData>? _dealsOffersList;
  AboutVideoData? _aboutVideoData;
  EarnedCrownResModel? _myCrownsData;
  String? _referAndEarnData;

  bool get isLoading => _isLoading;
  List<DealsOfferData>? get dealsOffersList => _dealsOffersList;
  List<CategoryData>? get categoryList => _categoryList;
  List<ProductData>? get topPicksList => _topPicksList;
  AboutVideoData? get aboutVideoList => _aboutVideoData;
  EarnedCrownResModel? get myCrownsData => _myCrownsData;
  String? get referAndEarnData => _referAndEarnData;

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
    await _homeDataRequest();

    showLoader(false);
  }

  Future<void> _homeDataRequest() async {
    await _homeRepo.homeDataRepo(_userId ?? '').then(
      (response) async {
        final result = HomeResModel.fromJson(response.data);

        if (response.statusCode == 200) {
          _categoryList = result.categoryListResModel?.data;
          _topPicksList = result.topPicksData;
          // _orderAgainList = result.orderAgainData;
          _aboutVideoData = result.aboutVideoResModel?.data;
          _referAndEarnData = result.referEarnResModel?.data;
          _dealsOffersList = result.dealsOfferData;
          _myCrownsData = result.earnedCrownResModel;

          Utils.showPrimarySnackbar(_context, result.message, type: SnackType.debug);
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

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
