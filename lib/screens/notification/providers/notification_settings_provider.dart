import 'package:poc/screens/notification/data/models/notification_prefs_model.dart';
import 'package:poc/screens/notification/data/notifications_repo.dart';
import 'package:poc/utils/base_provider.dart';

final notificationSettingProvider=ChangeNotifierProvider((ref)=>NotificationSettingProvider());

class NotificationSettingProvider extends BaseChangeNotifier {
  final NotificationsRepository _notifyRepo = NotificationsRepository();

  bool _enableAll = false, _order = false,_promo = false;  

  
  bool get enableAll  => _enableAll;
  bool get order => _order;
  bool get promo => _promo;

  NotificationPrefsReqModel get _notifyPrefsReqModel => NotificationPrefsReqModel();


    @override
  Future<void> postCreateState() async{
  }

  void enableAllNotificationSettingFun(bool i) {
    _enableAll = i;
    notifyListeners();
  }
  void orderNotificationSettingFun(bool i) {
    _order = i;
    notifyListeners();
  }
  void promoNotificationSettingFun(bool i) {
    _promo = i;
    notifyListeners();
  }

    Future<void> _notificationPrefsRequest() async {
    
    await _notifyRepo.notificationPrefs(_notifyPrefsReqModel).responseHandler(
      context,
      onSuccess: (response) {


        // Utils.showPrimarySnackbar(context, result.message, type: SnackType.debug);
      },
      onException: (e, st) {
        showLoader(false);
      },
    );
  }
  


}



