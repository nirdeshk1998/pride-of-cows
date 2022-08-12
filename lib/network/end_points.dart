class Endpoint {
  Endpoint._();

  static const String baseUrl = 'https://stagingpoc.heptawork.com/api';
  static const int receiveTimeout = 30000;
  static const int connectionTimeout = 30000;

  // Authentication
  static const String login = '/customer/login';
  static const String verifyOtp = '/customer/otpverifylogin';
  static const String resendMsgOtp = '/customer/resendotp';
  static const String resendCallOtp = '/customer/voiceotp';
  static const String userRegisterOtp = '/customer/register';

  // Data Lists
  static const String stateList = '/customer/statelist';
  static const String cityList = '/customer/citylist';
  static const String pincodeList = '/customer/pincodelist';
}
