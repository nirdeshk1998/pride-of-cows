import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final notificationSettingProvider=ChangeNotifierProvider((ref)=>NotificationSettingProvider());

class NotificationSettingProvider extends ChangeNotifier {
  bool _notificationSetting = false;

  bool get notificationSetting => _notificationSetting;

  void notificationSettingFun(bool i) {
    _notificationSetting = i;
    notifyListeners();
  }
}



