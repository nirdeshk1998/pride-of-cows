import 'package:dio/src/response.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/screens/authentication/data/models/login_model.dart';
import 'package:poc/screens/authentication/data/models/otp_model.dart';

class LoginRepository {
  Future<Response> sendOtpRepo(LoginReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.login, data: reqModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> verifyOtpRepo(OtpReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.verifyOtp, data: reqModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> resendSmsOtpRepo(OtpReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.resendMsgOtp, data: reqModel);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> resendCallOtpRepo(OtpReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.resendCallOtp, data: reqModel);
    } catch (e) {
      throw Exception(e);
    }
  }
}
