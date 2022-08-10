class Endpoint {
  Endpoint._();

  static const String baseUrl = 'https://stagingpoc.heptawork.com/api';
  static const int receiveTimeout = 15000;
  static const int connectionTimeout = 15000;

  // Authentication
  static const String login = '/customer/login';
  static const String verifyOtp = '/customer/otpverifylogin';
}
