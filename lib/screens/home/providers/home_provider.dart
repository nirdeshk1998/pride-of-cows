import 'package:poc/screens/home/data/home_repo.dart';
import 'package:poc/screens/home/data/models/category_model.dart';
import 'package:poc/screens/home/data/models/home_model.dart';
import 'package:poc/screens/products/data/models/products_model.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final homeProvider = ChangeNotifierProvider((ref) => HomeChangeProvider());

class HomeChangeProvider extends BaseChangeNotifier {
  final HomeRepository _homeRepo = HomeRepository();

  String? _userId;
  List<CategoryData>? _categoryList;
  List<ProductData>? _topPicksList;
  List<DealsOfferData>? _dealsOffersList;
  AboutVideoData? _aboutVideoData;
  EarnedCrownResModel? _myCrownsData;
  String? _referAndEarnData;

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

  @override
  Future<void> postCreateState() async {

    // FirebaseMessaging.onMessage.listen(
    //   FCMService.instance.firebaseMessagingForgroundHandler,
    // );

  

    await _gettingPrefs();
    await _homeDataRequest();
  }

  Future<void> _homeDataRequest() async {
    await _homeRepo.homeDataRepo(_userId ?? '').responseHandler(
      context,
      onSuccess: (response) {
        final result = HomeResModel.fromJson(response.data);

        _categoryList = result.categoryListResModel?.data;
        _topPicksList = result.topPicksData;
        // _orderAgainList = result.orderAgainData;
        _aboutVideoData = result.aboutVideoResModel?.data;
        _referAndEarnData = result.referEarnResModel?.data;
        _dealsOffersList = result.dealsOfferData;
        _myCrownsData = result.earnedCrownResModel;

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
    // then(
    //   (response) async {
    //     final result = HomeResModel.fromJson(response.data);

    //     if (response.statusCode == 200) {
    //       _categoryList = result.categoryListResModel?.data;
    //       _topPicksList = result.topPicksData;
    // _orderAgainList = result.orderAgainData;
    //       _aboutVideoData = result.aboutVideoResModel?.data;
    //       _referAndEarnData = result.referEarnResModel?.data;
    //       _dealsOffersList = result.dealsOfferData;
    //       _myCrownsData = result.earnedCrownResModel;

    //       Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
    //     } else {
    //       Utils.showPrimarySnackbar(context, result.message, type: SnackType.error);
    //     }
    //   },
    // );
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
