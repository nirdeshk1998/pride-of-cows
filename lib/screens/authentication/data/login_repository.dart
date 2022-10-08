import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/authentication/data/models/login_model.dart';
import 'package:poc/screens/authentication/data/models/otp_model.dart';

class LoginRepository {
  Future<LoginResModel> sendOtpRepo(LoginReqModel reqModel) async {
    try {
      final response = await BaseDio.getInstance().post(Endpoint.login, data: reqModel);
      return LoginResModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
  Future<OtpResModel> verifyOtpRepo(OtpReqModel reqModel) async {
    try {
      final response = await BaseDio.getInstance().post(Endpoint.verifyOtp, data: reqModel);
      return OtpResModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
