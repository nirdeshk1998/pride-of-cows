import 'package:dio/dio.dart';
import 'package:poc/network/dio_client.dart';
import 'package:poc/network/end_points.dart';
import 'package:poc/screens/authentication/data/models/login_model.dart';
import 'package:poc/screens/authentication/data/models/otp_model.dart';
import 'package:poc/screens/authentication/data/models/user_register_model.dart';

class AuthenticationRepository {
  Future<Response> sendOtpRepo(LoginReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.login, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> verifyOtpRepo(OtpReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.verifyOtp, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> resendSmsOtpRepo(OtpReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.resendMsgOtp, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> resendCallOtpRepo(OtpReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.resendCallOtp, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response> userRegistrationRepo(UserRegisterReqModel reqModel) async {
    try {
      return await BaseDio.getInstance().post(Endpoint.userRegisterOtp, data: reqModel.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }
}
