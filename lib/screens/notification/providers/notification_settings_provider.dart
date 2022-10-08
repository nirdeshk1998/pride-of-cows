import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationSettingProvider=ChangeNotifierProvider((ref)=>NotificationSettingProvider());

class NotificationSettingProvider extends ChangeNotifier {
  bool enableAll = false;
  bool order = false;
  bool promo = false;
  void enableAllNotificationSettingFun(bool i) {
    enableAll = i;
    notifyListeners();
  }
  void orderNotificationSettingFun(bool i) {
    order = i;
    notifyListeners();
  }
  void promoNotificationSettingFun(bool i) {
    promo = i;
    notifyListeners();
  }
}



