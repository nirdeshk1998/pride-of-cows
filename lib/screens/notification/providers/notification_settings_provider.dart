import 'package:poc/network/models/common_model.dart';
import 'package:poc/screens/notification/data/models/notification_prefs_model.dart';
import 'package:poc/screens/notification/data/notifications_repo.dart';
import 'package:poc/utils/base_provider.dart';
import 'package:poc/utils/local_storage.dart';
import 'package:poc/utils/utils.dart';

final notificationPrefsProvider = ChangeNotifierProvider.autoDispose((ref) => NotificationSettingProvider());

class NotificationSettingProvider extends BaseChangeNotifier {
  final NotificationsRepository _notifyRepo = NotificationsRepository();

  bool _enableAll = false, _order = false, _promo = false;
  String? _userId;

  bool get enableAll => _enableAll;
  bool get order => _order;
  bool get promo => _promo;

  @override
  Future<void> postCreateState() async {
    await _gettingPrefs();
    await _getNotificationPrefsRequest();
  }

  Future<void> enableAllSwitch(bool i) async {
    await _setNotificationPrefsRequest(enableAll: i ? 1 : 0, orderPurchase: i ? 1 : 0, promoOffers: i ? 1 : 0);
    _enableAll = i;
    _order = i;
    _promo = i;
  }

  Future<void> orderPurchaseSwitch(bool i) async {
    await _setNotificationPrefsRequest(orderPurchase: i ? 1 : 0);
    _order = i;
  }

  Future<void> promoOffersSwitch(bool i) async {
    await _setNotificationPrefsRequest(promoOffers: i ? 1 : 0);
    _promo = i;
  }

  Future<void> _getNotificationPrefsRequest() async {
    await _notifyRepo.getNotificationPrefs(_userId).responseHandler(
      context,
      onSuccess: (response) {
        final result = NotificationPrefsResModel.fromJson(response.data);

        _enableAll = result.data?.enableAll == 1 ? true : false;
        _order = result.data?.orderAndPurchase == 1 ? true : false;
        _promo = result.data?.promosAndOffer == 1 ? true : false;

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }

  Future<void> _setNotificationPrefsRequest({int? enableAll, int? orderPurchase, int? promoOffers}) async {
    final reqModel = NotificationPrefsReqModel(
      userID: _userId,
      enableAll: enableAll ?? 0,
      orderAndPurchase: orderPurchase ?? 0,
      promosAndOffer: promoOffers ?? 0,
    );

    showLoader(true);
    await _notifyRepo.setNotificationPrefs(reqModel).responseHandler(
      context,
      onSuccess: (response) {
        final result = CommonResModel.fromJson(response.data);

        Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
    showLoader(false);
  }

  Future<void> _gettingPrefs() async {
    _userId = await LocalStorage.getString(StorageField.userId);
  }
}
