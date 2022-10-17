import 'package:poc/constants/field_constant.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/notification/data/models/notification_prefs_model.dart';

class NotificationsRepository {


  Future<Response> getNotificationPrefs(String? userId) {
    return BaseDio.getInstance().post(
      Endpoint.getNotificationPrefs,
      data: {FieldConstant.userID: userId},
    );
  }

  Future<Response> setNotificationPrefs(NotificationPrefsReqModel reqModel) {
    return BaseDio.getInstance().post(
      Endpoint.setNotificationPrefs,
      data: reqModel.toJson(),
    );
  }
}