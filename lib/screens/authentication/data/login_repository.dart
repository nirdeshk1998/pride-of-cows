import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';

class LoginRepository {
  Future<void> sendOtpRepo() async {
    final response = await BaseDio.getInstance().post(Endpoint.login);

    return response.data;
  }
}
