import 'package:poc/network/dio_client.dart';
import 'package:poc/screens/authentication/data/models/login_model.dart';
import 'package:poc/screens/authentication/data/models/otp_model.dart';
import 'package:poc/screens/authentication/data/models/user_register_model.dart';

class AuthenticationRepository {
  Future<Response> sendOtpRepo(LoginReqModel reqModel) async => await BaseDio.getInstance().post(
        Endpoint.login,
        data: reqModel.toJson(),
      );

  Future<Response> verifyOtpRepo(OtpReqModel reqModel) async => await BaseDio.getInstance().post(
        Endpoint.verifyOtp,
        data: reqModel.toJson(),
      );

  Future<Response> resendSmsOtpRepo(OtpReqModel reqModel) async => await BaseDio.getInstance().post(
        Endpoint.resendMsgOtp,
        data: reqModel.toJson(),
      );

  Future<Response> resendCallOtpRepo(OtpReqModel reqModel) async => await BaseDio.getInstance().post(
        Endpoint.resendCallOtp,
        data: reqModel.toJson(),
      );

  Future<Response> userRegistrationRepo(UserRegisterReqModel reqModel) async => await BaseDio.getInstance().post(
        Endpoint.userRegisterOtp,
        data: reqModel.toJson(),
      );
}
