import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/notification/data/models/notification_prefs_model.dart';

class NotificationsRepository {


  Future<Response> notificationPrefs(NotificationPrefsReqModel reqModel) {
    return BaseDio.getInstance().post(
      Endpoint.getOrderDetails,
      data: reqModel.toJson(),
    );
  }
}